@implementation HMDHomeWalletKeyAccessoryManager

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeWalletKeyAccessoryManager uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t208 != -1)
    dispatch_once(&logCategory__hmf_once_t208, &__block_literal_global_294);
  return (id)logCategory__hmf_once_v209;
}

- (void)handleAccessoryConfigured:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__HMDHomeWalletKeyAccessoryManager_handleAccessoryConfigured___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)configureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  HMDHomeWalletKeyAccessoryConfigureState *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDHomeWalletKeyAccessoryManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDHomeWalletKeyAccessoryManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDHomeWalletKeyAccessoryManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[5];
  HMDHomeWalletKeyAccessoryConfigureState *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v48 = v12;
    v49 = 2112;
    v50 = v13;
    v51 = 2112;
    v52 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for accessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (objc_msgSend(v6, "supportsWalletKey"))
  {
    -[HMDHomeWalletKeyAccessoryManager dataSource](v10, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isWatch");

    if ((v16 & 1) == 0)
    {
      -[HMDHomeWalletKeyAccessoryManager home](v10, "home");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "currentUser");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isOwner");

        if (v20)
        {
          -[HMDHomeWalletKeyAccessoryManager nfcReaderKeyConfigureStateByAccessoryUUID](v10, "nfcReaderKeyConfigureStateByAccessoryUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "uuid");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v22);
          v23 = (HMDHomeWalletKeyAccessoryConfigureState *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            v23 = objc_alloc_init(HMDHomeWalletKeyAccessoryConfigureState);
            -[HMDHomeWalletKeyAccessoryManager nfcReaderKeyConfigureStateByAccessoryUUID](v10, "nfcReaderKeyConfigureStateByAccessoryUUID");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "uuid");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

          }
          if (-[HMDHomeWalletKeyAccessoryConfigureState readerKeyConfigured](v23, "readerKeyConfigured"))
          {
            v26 = (void *)MEMORY[0x1D17BA0A0]();
            v27 = v10;
            HMFGetOSLogHandle();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "UUID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "shortDescription");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v48 = v29;
              v49 = 2112;
              v50 = v30;
              v51 = 2112;
              v52 = v31;
              _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory is already configured with reader key: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v26);
          }
          else if (-[HMDHomeWalletKeyAccessoryConfigureState readerKeyConfigureInProgress](v23, "readerKeyConfigureInProgress"))
          {
            v37 = (void *)MEMORY[0x1D17BA0A0]();
            v38 = v10;
            HMFGetOSLogHandle();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "UUID");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "shortDescription");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v48 = v40;
              v49 = 2112;
              v50 = v41;
              v51 = 2112;
              v52 = v42;
              _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Setting should retry on nfc reader key configure failure for accessory: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v37);
            -[HMDHomeWalletKeyAccessoryConfigureState setShouldRetryReaderKeyConfigureOnFailure:](v23, "setShouldRetryReaderKeyConfigureOnFailure:", 1);
          }
          else
          {
            -[HMDHomeWalletKeyAccessoryConfigureState setReaderKeyConfigureInProgress:](v23, "setReaderKeyConfigureInProgress:", 1);
            v43[0] = MEMORY[0x1E0C809B0];
            v43[1] = 3221225472;
            v43[2] = __75__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyForAccessory_flow___block_invoke;
            v43[3] = &unk_1E89BA850;
            v43[4] = v10;
            v44 = v23;
            v45 = v7;
            v46 = v6;
            -[HMDHomeWalletKeyAccessoryManager fetchOrConfigureNFCReaderKeyForAccessory:flow:completion:](v10, "fetchOrConfigureNFCReaderKeyForAccessory:flow:completion:", v46, v45, v43);

          }
        }
      }
      else
      {
        v32 = (void *)MEMORY[0x1D17BA0A0]();
        v33 = v10;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "UUID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v48 = v35;
          v49 = 2112;
          v50 = v36;
          v51 = 2112;
          v52 = v6;
          _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Home does not exist when configuring reader key for accessory: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v32);
      }

    }
  }

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

void __62__HMDHomeWalletKeyAccessoryManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because accessory was configured", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "configureNFCReaderKeyForAccessory:flow:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(a1 + 32), "handlePendingDeviceCredentialKeysSyncForAccessory:withReason:", *(_QWORD *)(a1 + 40), CFSTR("accessory connected"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(*(id *)(a1 + 40), "supportsHAP"))
  {
    objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Fetching wallet key color because accessory was configured", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "fetchWalletKeyColorWithAccessory:flow:", *(_QWORD *)(a1 + 40), v9);

  }
}

- (void)handlePendingDeviceCredentialKeysSyncForAccessory:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "supportsWalletKey"))
  {
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyAccessoryManager handlePendingDeviceCredentialKeysSyncForAccessories:withReason:](self, "handlePendingDeviceCredentialKeysSyncForAccessories:withReason:", v9, v7);

  }
}

- (void)fetchWalletKeyColorWithAccessory:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (objc_msgSend(v6, "supportsWalletKey"))
  {
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithAccessory_flow___block_invoke;
    v10[3] = &unk_1E89BAC30;
    v10[4] = self;
    v11 = v7;
    v12 = v6;
    -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorForAccessories:flow:withCompletion:](self, "fetchWalletKeyColorForAccessories:flow:withCompletion:", v9, v11, v10);

  }
}

- (HMDHomeWalletKeyAccessoryManagerDelegate)delegate
{
  return (HMDHomeWalletKeyAccessoryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)registerForNotificationsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
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
  HMDHomeWalletKeyAccessoryManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
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
    *(_DWORD *)buf = 138543618;
    v29 = v9;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications with reason: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyAccessoryManager home](v7, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_handleWalletKeySupportDidChange_, CFSTR("HMDAccessorySupportsWalletKeyDidChangeNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nfcReaderKeyManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_handleHomeNFCReaderKeyKeychainItemAvailableNotification_, CFSTR("HMDHomeNFCReaderKeyKeychainItemAvailableNotification"), v14);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel_handleHomeAddedAccessoryNotification_, CFSTR("HMDNotificationHomeAddedAccessory"), v10);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_handleHomeUserAddedNotification_, CFSTR("HMDHomeUserAddedNotification"), v10);

  -[HMDHomeWalletKeyAccessoryManager configureNFCReaderKeyForAllAccessoriesWithReason:](v7, "configureNFCReaderKeyForAllAccessoriesWithReason:", CFSTR("Registering for notifications"));
  objc_msgSend(v10, "accessoriesWithWalletKeySupport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager handlePendingDeviceCredentialKeysSyncForAccessories:withReason:](v7, "handlePendingDeviceCredentialKeysSyncForAccessories:withReason:", v17, CFSTR("notifications registered"));

  -[HMDHomeWalletKeyAccessoryManager delegate](v7, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v7;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      v30 = 2112;
      v31 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Fetching wallet key color after registering for notifications", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __71__HMDHomeWalletKeyAccessoryManager_registerForNotificationsWithReason___block_invoke;
    v26[3] = &unk_1E89BFEC0;
    v26[4] = v21;
    v27 = v19;
    v25 = v19;
    -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorWithFlow:completion:](v21, "fetchWalletKeyColorWithFlow:completion:", v25, v26);

  }
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (void)configureNotificationsWithReason:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[HMDHomeWalletKeyAccessoryManager isCurrentDevicePrimaryResident](self, "isCurrentDevicePrimaryResident"))
  {
    if (-[HMDHomeWalletKeyAccessoryManager canConfigureAccessories](self, "canConfigureAccessories"))
      goto LABEL_8;
    v5 = 1;
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "hasCharacteristicNotificationRegistrations");

    if ((_DWORD)v5 == -[HMDHomeWalletKeyAccessoryManager canConfigureAccessories](self, "canConfigureAccessories"))
      goto LABEL_8;
  }
  -[HMDHomeWalletKeyAccessoryManager setCanConfigureAccessories:](self, "setCanConfigureAccessories:", v5);
  if (-[HMDHomeWalletKeyAccessoryManager canConfigureAccessories](self, "canConfigureAccessories"))
    -[HMDHomeWalletKeyAccessoryManager registerForNotificationsWithReason:](self, "registerForNotificationsWithReason:", v7);
  else
    -[HMDHomeWalletKeyAccessoryManager unregisterForNotificationsWithReason:](self, "unregisterForNotificationsWithReason:", v7);
LABEL_8:

}

- (BOOL)canConfigureAccessories
{
  return self->_canConfigureAccessories;
}

- (void)fetchWalletKeyColorWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKeyAccessoryManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  HMDHomeWalletKeyAccessoryManager *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHomeWalletKeyAccessoryManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void (**v49)(id, void *, _QWORD);
  _QWORD v50[5];
  void (**v51)(id, void *, _QWORD);
  uint64_t v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v12;
    v56 = 2112;
    v57 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeWalletKeyAccessoryManager dataSource](v10, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager walletKeyColorPreferenceKey](v10, "walletKeyColorPreferenceKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberValueFromNoBackupStoreWithKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v10;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v20;
      v56 = 2112;
      v57 = v21;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping fetch, returning wallet key color from persistent store", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v7[2](v7, v16, 0);
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager home](v10, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "accessoriesWithWalletKeySupport");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "na_any:", &__block_literal_global_151609);

    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v10;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v49 = v7;
      v29 = v6;
      v30 = v22;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v55 = v28;
      v56 = 2112;
      v57 = v31;
      v58 = 2112;
      v59 = v32;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for home that does have Matter accessories: %@", buf, 0x20u);

      v22 = v30;
      v6 = v29;
      v7 = v49;

    }
    objc_autoreleasePoolPop(v25);
    if (-[HMDHomeWalletKeyAccessoryManager isPrimaryResidentOrSoleOwnerController](v26, "isPrimaryResidentOrSoleOwnerController")|| ((v24 ^ 1) & 1) != 0)
    {
      objc_msgSend(v22, "accessoriesWithWalletKeySupport");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "count"))
      {
        -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorForAccessories:flow:withCompletion:](v26, "fetchWalletKeyColorForAccessories:flow:withCompletion:", v40, v6, v7);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v48);

      }
    }
    else
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v26;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v36;
        v56 = 2112;
        v57 = v37;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Redispatching FetchWalletKeyColorMessage to resident because home has matter accessories", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      v38 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[HMDHomeWalletKeyAccessoryManager messageTargetUUID](v34, "messageTargetUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)objc_msgSend(v38, "initWithTarget:", v39);

      v41 = objc_alloc(MEMORY[0x1E0D285D0]);
      v42 = *MEMORY[0x1E0CB8DA8];
      v52 = *MEMORY[0x1E0D28010];
      HMFEncodedRootObject();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v43;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)objc_msgSend(v41, "initWithName:destination:payload:", v42, v40, v44);

      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke_141;
      v50[3] = &unk_1E89BE018;
      v50[4] = v34;
      v51 = v7;
      objc_msgSend(v45, "setResponseHandler:", v50);
      -[HMDHomeWalletKeyAccessoryManager messageTargetUUID](v34, "messageTargetUUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyAccessoryManager workQueue](v34, "workQueue");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "redispatchToResidentMessage:target:responseQueue:", v45, v46, v47);

    }
  }

}

void __82__HMDHomeWalletKeyAccessoryManager_handleHomeDidEnableCharacteristicNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configureNotificationsWithReason:", v2);

}

void __71__HMDHomeWalletKeyAccessoryManager_registerForNotificationsWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "integerValue");
      HMHomeWalletKeyColorAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully fetched wallet key color when registered for notifications %@", (uint8_t *)&v15, 0x20u);

LABEL_6:
    }
  }
  else if (v10)
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v11;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Could not fetch wallet key color when registered for notifications %@", (uint8_t *)&v15, 0x20u);

    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

- (NSString)walletKeyColorPreferenceKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3A28];
  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("6D369245-5382-4703-8011-3DFE12E5147C"), "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_UUIDWithNamespace:data:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setCanConfigureAccessories:(BOOL)a3
{
  self->_canConfigureAccessories = a3;
}

- (BOOL)isPrimaryResidentOrSoleOwnerController
{
  void *v2;
  char v3;

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident");

  return v3;
}

- (BOOL)isCurrentDevicePrimaryResident
{
  return self->_currentDevicePrimaryResident;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)handlePendingDeviceCredentialKeysSyncForAccessories:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HMDHomeWalletKeyAccessoryManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  HMDHomeWalletKeyAccessoryManager *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v30 = v6;
  if (objc_msgSend(v6, "count"))
  {
    -[HMDHomeWalletKeyAccessoryManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentUser");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isOwner");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v15;
        v44 = 2112;
        v45 = v7;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Handling pending device credential operations with reason: %@", buf, 0x16u);

      }
      v28 = v7;

      objc_autoreleasePoolPop(v12);
      v29 = v13;
      -[HMDHomeWalletKeyAccessoryManager pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID](v13, "pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");

      v40 = 0u;
      v38 = 0u;
      v39 = 0u;
      v37 = 0u;
      v18 = v17;
      v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v32)
      {
        v31 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v18);
            v20 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "user");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
            {
              v23 = MEMORY[0x1E0C809B0];
              v35[0] = MEMORY[0x1E0C809B0];
              v35[1] = 3221225472;
              v35[2] = __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke;
              v35[3] = &unk_1E89BA910;
              v24 = v21;
              v36 = v24;
              objc_msgSend(v30, "na_filter:", v35);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "deviceCredentialKey");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D28580], "untrackedPlaceholderFlow");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v33[0] = v23;
              v33[1] = 3221225472;
              v33[2] = __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke_2;
              v33[3] = &unk_1E89C21C0;
              v33[4] = v29;
              v34 = v24;
              -[HMDHomeWalletKeyAccessoryManager configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:](v29, "configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:", v25, v26, 0, v20, v22, v27, v33);

            }
          }
          v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v32);
      }

      v7 = v28;
    }
  }

}

- (void)handleHomeDidEnableCharacteristicNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__HMDHomeWalletKeyAccessoryManager_handleHomeDidEnableCharacteristicNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (HMDHomeWalletDataSource)dataSource
{
  return (HMDHomeWalletDataSource *)objc_getProperty(self, a2, 64, 1);
}

- (void)configureNFCReaderKeyForAllAccessoriesWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyAccessoryManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2112;
    v26 = v11;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC reader key for all accessories with reason: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDHomeWalletKeyAccessoryManager home](v8, "home", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessoriesWithWalletKeySupport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[HMDHomeWalletKeyAccessoryManager configureNFCReaderKeyForAccessory:flow:](v8, "configureNFCReaderKeyForAccessory:flow:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17++), v6);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

}

- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  HMDHomeWalletDataSource *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDHomeWalletDataSource);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDHomeWalletKeyAccessoryManager initWithUUID:workQueue:dataSource:notificationCenter:](self, "initWithUUID:workQueue:dataSource:notificationCenter:", v7, v6, v8, v9);

  return v10;
}

- (HMDHomeWalletKeyAccessoryManager)initWithUUID:(id)a3 workQueue:(id)a4 dataSource:(id)a5 notificationCenter:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDHomeWalletKeyAccessoryManager *v15;
  HMDHomeWalletKeyAccessoryManager *v16;
  uint64_t v17;
  NSMutableDictionary *nfcReaderKeyConfigureStateByAccessoryUUID;
  uint64_t v19;
  NSMutableDictionary *pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID;
  NSMutableSet *v21;
  NSMutableSet *logEvents;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDHomeWalletKeyAccessoryManager;
  v15 = -[HMDHomeWalletKeyAccessoryManager init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    objc_storeStrong((id *)&v16->_dataSource, a5);
    objc_storeStrong((id *)&v16->_notificationCenter, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    nfcReaderKeyConfigureStateByAccessoryUUID = v16->_nfcReaderKeyConfigureStateByAccessoryUUID;
    v16->_nfcReaderKeyConfigureStateByAccessoryUUID = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID = v16->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID;
    v16->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID = (NSMutableDictionary *)v19;

    v21 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    logEvents = v16->_logEvents;
    v16->_logEvents = v21;

    objc_msgSend(MEMORY[0x1E0D28570], "blessWithImplicitContext:", v16->_workQueue);
  }

  return v16;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDHomeWalletKeyAccessoryManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  NSObject *v36;
  id v37;
  void *v38;
  _QWORD block[5];
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[3];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v8;
    v48 = 2112;
    v49 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring with home: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHomeWalletKeyAccessoryManager setHome:](v6, "setHome:", v4);
  objc_msgSend(v4, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager setMessageDispatcher:](v6, "setMessageDispatcher:", v9);

  -[HMDHomeWalletKeyAccessoryManager dataSource](v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isResidentCapable");

  if (v11)
  {
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v38;
    v45[1] = v14;
    v45[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
    objc_msgSend(v4, "msgDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    v44[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessage"), v6, v17, sel_handleConfigureAccessoriesWithDeviceCredentialKeyMessage_);

    objc_msgSend(v4, "msgDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CB9348];
    v43[0] = v12;
    v43[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForMessage:receiver:policies:selector:", v19, v6, v20, sel_handleFetchMissingWalletKeysMessage_);

    objc_msgSend(v4, "msgDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x1E0CB9388];
    v42[0] = v12;
    v42[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "registerForMessage:receiver:policies:selector:", v22, v6, v23, sel_handleRestoreMissingWalletKeysMessage_);

    objc_msgSend(v4, "msgDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB8DA8];
    v41[0] = v12;
    v41[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerForMessage:receiver:policies:selector:", v25, v6, v26, sel_handleFetchWalletKeyColorMessage_);

    objc_msgSend(v4, "msgDispatcher");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeConfigureMatterAccessoryWithReaderKeyMessage"), v6, v15, sel_handleHMDHomeConfigureMatterAccessoryWithReaderKeyMessage_);

    objc_msgSend(v4, "msgDispatcher");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerForMessage:receiver:policies:selector:", CFSTR("HMDHomeWalletKeyAccessoryManagerAddIssuerKeysToAccessoriesMessage"), v6, v15, sel__handleAddIssuerKeysToAccessoriesMessage_);

  }
  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObserver:selector:name:object:", v6, sel_handleHomeDidEnableCharacteristicNotification_, CFSTR("HMDHomeDidEnableCharacteristicNotifyEventNotification"), v4);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", v6, sel_handleHomeDidDisableCharacteristicNotification_, CFSTR("HMDHomeDidDisableCharacteristicNotifyEventNotification"), v4);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "residentDeviceManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:selector:name:object:", v6, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), v32);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addObserver:selector:name:object:", v6, sel_handlePrimaryResidentUpdateNotification_, CFSTR("HMDResidentDeviceConfirmedStateChangedNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "addObserver:selector:name:object:", v6, sel_handleHomeAccessoryRemovedNotification_, CFSTR("HMDHomeAccessoryRemovedNotification"), v4);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v6, "notificationCenter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObserver:selector:name:object:", v6, sel_handleAccessoryCharacteristicsChangedNotification_, CFSTR("HMDAccessoryCharacteristicsChangedNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager workQueue](v6, "workQueue");
  v36 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeWalletKeyAccessoryManager_configureWithHome___block_invoke;
  block[3] = &unk_1E89C2328;
  block[4] = v6;
  v40 = v4;
  v37 = v4;
  dispatch_async(v36, block);

}

- (void)configureAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  v18[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDHomeWalletKeyAccessoryManager configureAccessories:withDeviceCredentialKey:ofType:flow:completion:](self, "configureAccessories:withDeviceCredentialKey:ofType:flow:completion:", v17, v14, a5, v13, v12);
}

- (void)configureAllAccessoriesWithDeviceCredentialKey:(id)a3 ofType:(int64_t)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accessoriesWithWalletKeySupport");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager configureAccessories:withDeviceCredentialKey:ofType:flow:completion:](self, "configureAccessories:withDeviceCredentialKey:ofType:flow:completion:", v14, v12, a4, v11, v10);

}

- (void)handleWalletKeyRemoved
{
  NSObject *v3;
  void *v4;
  HMDHomeWalletKeyAccessoryManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling wallet key removed", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  -[HMDHomeWalletKeyAccessoryManager dataSource](v5, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager walletKeyColorPreferenceKey](v5, "walletKeyColorPreferenceKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistNumberValueToNoBackupStore:withKey:", 0, v9);

}

- (void)unconfigure
{
  void *v3;
  id v4;

  -[HMDHomeWalletKeyAccessoryManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](self, "notificationCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)handleFetchWalletKeyColorMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "flow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling HMHomeFetchWalletKeyColorMessage", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HMDHomeWalletKeyAccessoryManager_handleFetchWalletKeyColorMessage___block_invoke;
  v12[3] = &unk_1E89BA208;
  v13 = v4;
  v11 = v4;
  -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorWithFlow:completion:](v7, "fetchWalletKeyColorWithFlow:completion:", v5, v12);

}

- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation initWithDeviceCredentialKey:accessoriesUUIDs:user:]([HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc], "initWithDeviceCredentialKey:accessoriesUUIDs:user:", v11, v12, v10);
  -[HMDHomeWalletKeyAccessoryManager pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID](self, "pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v16, "operationByMergingWithOperation:", v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v14 = (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)v17;
  }
  -[HMDHomeWalletKeyAccessoryManager pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID](self, "pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, v19);

}

- (void)createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:(id)a3 deviceCredentialKey:(id)a4 user:(id)a5 deviceUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "uuid", (_QWORD)v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v18);
  }

  -[HMDHomeWalletKeyAccessoryManager createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:deviceCredentialKey:user:deviceUUID:](self, "createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:deviceCredentialKey:user:deviceUUID:", v15, v11, v12, v13);
}

- (void)handleFetchMissingWalletKeysMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  HMDHomeWalletKeyAccessoryManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v9;
    v44 = 2112;
    v45 = v10;
    v46 = 2112;
    v47 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling FetchMissingWalletKeysMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB9350]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x1E0CB9378]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
  v15 = (void *)v14;
  if (v13)
  {
    -[HMDHomeWalletKeyAccessoryManager home](v7, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userForHome:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDHomeWalletKeyAccessoryManager fetchMissingWalletKeysForAccessoryUUID:forUser:flow:](v7, "fetchMissingWalletKeysForAccessoryUUID:forUser:flow:", v13, v17, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke;
    v40[3] = &unk_1E89BA230;
    v19 = v4;
    v41 = v19;
    objc_msgSend(v18, "addSuccessBlock:", v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_2;
    v38[3] = &unk_1E89C2350;
    v39 = v19;
    v21 = (id)objc_msgSend(v20, "addFailureBlock:", v38);

  }
  else if (v14)
  {
    -[HMDHomeWalletKeyAccessoryManager fetchMissingWalletKeysForUserUUID:flow:](v7, "fetchMissingWalletKeysForUserUUID:flow:", v14, v5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v5;
    v24 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_3;
    v36[3] = &unk_1E89BA230;
    v25 = v4;
    v37 = v25;
    objc_msgSend(v22, "addSuccessBlock:", v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v24;
    v5 = v23;
    v34[1] = 3221225472;
    v34[2] = __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_4;
    v34[3] = &unk_1E89C2350;
    v35 = v25;
    v27 = (id)objc_msgSend(v26, "addFailureBlock:", v34);

    v17 = v37;
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v7;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "UUID");
      v33 = v28;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v31;
      v44 = 2112;
      v45 = v32;
      v46 = 2112;
      v47 = v4;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not find either accessoryUUID or userUUID in message: %@", buf, 0x20u);

      v28 = v33;
    }

    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v17);
  }

}

- (void)handleRestoreMissingWalletKeysMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    v30 = 2112;
    v31 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Handling RestoreMissingWalletKeysMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v11 = *MEMORY[0x1E0CB9370];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchivedObjectForKey:ofClasses:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_152_151599);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_2;
  v23[3] = &unk_1E89BA298;
  v23[4] = v7;
  v24 = v5;
  v16 = v5;
  objc_msgSend(v14, "na_map:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "combineAllFutures");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_3;
  v21[3] = &unk_1E89BA2C0;
  v22 = v4;
  v19 = v4;
  v20 = (id)objc_msgSend(v18, "addSuccessBlock:", v21);

}

- (id)restoreMissingWalletKeys:(id)a3 onAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  HMDHomeWalletKeyAccessoryManager *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[4];
  id v36;
  HMDHomeWalletKeyAccessoryManager *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v45 = v14;
    v46 = 2112;
    v47 = v15;
    v48 = 2112;
    v49 = v8;
    v50 = 2112;
    v51 = v16;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Restoring missing wallet keys: %@ on accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  if ((objc_msgSend(v9, "supportsCHIP") & 1) != 0)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HMDHomeWalletKeyAccessoryManager configureNFCReaderKeyOnMatterAccessory:flow:](v12, "configureNFCReaderKeyOnMatterAccessory:flow:", v9, v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke;
    v41[3] = &unk_1E89C21C0;
    v20 = v17;
    v42 = v20;
    v21 = v8;
    v43 = v21;
    objc_msgSend(v18, "addFailureBlock:", v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v19;
    v35[1] = 3221225472;
    v35[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2;
    v35[3] = &unk_1E89BA430;
    v36 = v21;
    v37 = v12;
    v38 = v10;
    v39 = v9;
    v23 = v20;
    v40 = v23;
    v24 = (id)objc_msgSend(v22, "addSuccessBlock:", v35);

    v25 = v40;
    v26 = v23;

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
    v28 = v12;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uuid");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v30;
      v46 = 2112;
      v47 = v31;
      v48 = 2112;
      v49 = v32;
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not restoring wallet key on non-Matter accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v27);
    v33 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "futureWithResult:", v18);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v26;
}

- (id)fetchMissingWalletKeysForAccessoryUUID:(id)a3 forUser:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeWalletKeyAccessoryManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys for accessory UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  -[HMDHomeWalletKeyAccessoryManager home](v12, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessoryWithUUID:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  if ((objc_msgSend(v19, "supportsWalletKey") & 1) != 0)
  {
    objc_msgSend(v16, "users");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyAccessoryManager fetchMissingWalletKeysForAccessory:users:flow:](v12, "fetchMissingWalletKeysForAccessory:users:flow:", v19, v20, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __88__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessoryUUID_forUser_flow___block_invoke;
    v32[3] = &unk_1E89BA458;
    v32[4] = v12;
    v33 = v10;
    v34 = v8;
    objc_msgSend(v21, "addCompletionBlock:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = v12;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v26;
      v37 = 2112;
      v38 = v27;
      v39 = 2112;
      v40 = v28;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not fetching missing wallet keys for accessory that does not support wallet key: %@", buf, 0x20u);

      v9 = v31;
    }

    objc_autoreleasePoolPop(v23);
    v29 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "futureWithResult:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)fetchMissingWalletKeysForUserUUID:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeWalletKeyAccessoryManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKeyAccessoryManager *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
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
    objc_msgSend(v7, "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v11;
    v46 = 2112;
    v47 = v12;
    v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys for user UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeWalletKeyAccessoryManager home](v9, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "userWithUUID:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoriesWithWalletKeySupport");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_filter:", &__block_literal_global_172);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "hmf_isEmpty"))
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = v9;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = v6;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v21;
      v46 = 2112;
      v47 = v22;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Did not find any Matter accessories supporting TTU", buf, 0x16u);

      v6 = v20;
    }

    objc_autoreleasePoolPop(v17);
    v23 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "futureWithResult:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_173;
    v41[3] = &unk_1E89BA4A0;
    v41[4] = v9;
    v42 = v14;
    v37 = v13;
    v26 = v6;
    v27 = v7;
    v43 = v27;
    objc_msgSend(v16, "na_map:", v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0D519E8], "immediateScheduler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "combineAllFutures:ignoringErrors:scheduler:", v28, 1, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "flatMap:", &__block_literal_global_177_151577);
    v32 = v14;
    v33 = v7;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_4;
    v38[3] = &unk_1E89BFE98;
    v38[4] = v9;
    v35 = v27;
    v6 = v26;
    v13 = v37;
    v39 = v35;
    v40 = v6;
    objc_msgSend(v34, "addCompletionBlock:", v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v33;
    v14 = v32;

  }
  return v25;
}

- (id)fetchMissingWalletKeysForAccessory:(id)a3 users:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  HMDHomeWalletKeyAccessoryManager *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v40 = v14;
    v41 = 2112;
    v42 = v15;
    v43 = 2112;
    v44 = v8;
    v45 = 2112;
    v46 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching missing wallet keys from accessory: %@, users: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  if (v8)
  {
    objc_msgSend(v9, "na_dictionaryWithKeyGenerator:", &__block_literal_global_182_151570);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "waitForDoorLockClusterObjectWithFlow:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "naFuture");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_2;
    v36[3] = &unk_1E89BA568;
    v20 = v16;
    v37 = v20;
    v21 = v10;
    v38 = v21;
    objc_msgSend(v18, "flatMap:", v36);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_3;
    v32[3] = &unk_1E89BA5D0;
    v32[4] = v12;
    v33 = v8;
    v34 = v20;
    v35 = v21;
    v23 = v20;
    objc_msgSend(v22, "flatMap:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v26 = v12;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v28;
      v41 = 2112;
      v42 = v29;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Returning empty set for nil accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v30 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "futureWithResult:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)missingWalletKeysForAccessoryUUID:(id)a3 usersByUniqueID:(id)a4 accessoryUsersByUniqueID:(id)a5 flow:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeWalletKeyAccessoryManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v33;
  _QWORD v34[4];
  id v35;
  HMDHomeWalletKeyAccessoryManager *v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "na_firstObjectPassingTest:", &__block_literal_global_187_151557);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "credentials");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "na_firstObjectPassingTest:", &__block_literal_global_189_151558);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {

    v19 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2_192;
    v34[3] = &unk_1E89BA6E0;
    v35 = v12;
    v36 = self;
    v37 = v13;
    v38 = v14;
    v39 = v11;
    v20 = v14;
    objc_msgSend(v16, "na_map:", v34);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUID");
      v33 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v26;
      v44 = 2112;
      v45 = v27;
      v46 = 2112;
      v47 = v14;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Reader key is missing on accessory: %@", buf, 0x20u);

      v23 = v33;
    }

    objc_autoreleasePoolPop(v23);
    v28 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "allValues");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_190;
    v40[3] = &unk_1E89BA678;
    v41 = v14;
    v30 = v14;
    objc_msgSend(v29, "na_map:", v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

- (void)handleConfigureAccessoriesWithDeviceCredentialKeyMessage:(id)a3
{
  __CFString *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeWalletKeyAccessoryManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeWalletKeyAccessoryManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDHomeWalletKeyAccessoryManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  void *v42;
  HMDHomeWalletKeyAccessoryManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  HMDHomeWalletKeyAccessoryManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDHomeWalletKeyAccessoryManager *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  __CFString *v70;
  _QWORD v71[5];
  id v72;
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  const __CFString *v79;
  __int16 v80;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[__CFString flow](v4, "flow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString messagePayload](v4, "messagePayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v75 = v10;
    v76 = 2112;
    v77 = (uint64_t)v11;
    v78 = 2112;
    v79 = v4;
    v80 = 2112;
    v81 = (uint64_t)v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Handling message to configure device credential key %@ with payload: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v7);
  -[HMDHomeWalletKeyAccessoryManager home](v8, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString userForHome:](v4, "userForHome:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[__CFString destination](v4, "destination");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
    {
      -[__CFString dataForKey:](v4, "dataForKey:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v65 = v6;
        -[__CFString numberForKey:](v4, "numberForKey:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[__CFString arrayForKey:](v4, "arrayForKey:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = MEMORY[0x1E0C809B0];
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke;
            v71[3] = &unk_1E89BA708;
            v71[4] = v8;
            v59 = v6;
            v72 = v59;
            v23 = v21;
            v73 = v23;
            v62 = v20;
            objc_msgSend(v20, "na_map:", v71);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "count"))
            {
              objc_msgSend(v17, "device");
              v24 = v22;
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "identifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDHomeWalletKeyAccessoryManager createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:deviceCredentialKey:user:deviceUUID:](v8, "createAccessoryDeviceCredentialKeyPendingOperationWithAccessoriesUUIDs:deviceCredentialKey:user:deviceUUID:", v23, v18, v14, v26);

              v22 = v24;
            }
            v58 = objc_msgSend(v19, "integerValue");
            objc_msgSend(v17, "device");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "identifier");
            v28 = v19;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v68[0] = v22;
            v68[1] = 3221225472;
            v68[2] = __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke_200;
            v68[3] = &unk_1E89C0DA8;
            v68[4] = v8;
            v69 = v59;
            v70 = v4;
            -[HMDHomeWalletKeyAccessoryManager configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:](v8, "configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:", v60, v18, v58, v29, v14, v69, v68);

            v19 = v28;
            v20 = v62;
          }
          else
          {
            v53 = (void *)MEMORY[0x1D17BA0A0]();
            v54 = v8;
            HMFGetOSLogHandle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v53;
              objc_msgSend(v65, "UUID");
              v56 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v75 = v61;
              v76 = 2112;
              v77 = v56;
              v57 = (void *)v56;
              v78 = 2112;
              v79 = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs");
              _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, mising parameter: %@", buf, 0x20u);

              v53 = v64;
            }

            objc_autoreleasePoolPop(v53);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
            v23 = (id)objc_claimAutoreleasedReturnValue();
            -[__CFString respondWithError:](v4, "respondWithError:", v23);
          }

        }
        else
        {
          v48 = (void *)MEMORY[0x1D17BA0A0]();
          v49 = v8;
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v63 = v48;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "UUID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v75 = v51;
            v76 = 2112;
            v77 = (uint64_t)v52;
            v78 = 2112;
            v79 = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType");
            _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, missing parameter: %@", buf, 0x20u);

            v48 = v63;
          }

          objc_autoreleasePoolPop(v48);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString respondWithError:](v4, "respondWithError:", v20);
        }
        v6 = v65;

      }
      else
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = v8;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = v42;
          v45 = v6;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "UUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v75 = v46;
          v76 = 2112;
          v77 = (uint64_t)v47;
          v78 = 2112;
          v79 = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey");
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, missing parameter: %@", buf, 0x20u);

          v6 = v45;
          v42 = v67;
        }

        objc_autoreleasePoolPop(v42);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString respondWithError:](v4, "respondWithError:", v19);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = v8;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString destination](v4, "destination");
        v66 = v6;
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v41 = objc_opt_class();
        *(_DWORD *)buf = 138544130;
        v75 = v38;
        v76 = 2112;
        v77 = (uint64_t)v39;
        v78 = 2112;
        v79 = v40;
        v80 = 2112;
        v81 = v41;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Message destination is not of expected type %@:%@", buf, 0x2Au);

        v6 = v66;
      }

      objc_autoreleasePoolPop(v35);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString respondWithError:](v4, "respondWithError:", v18);
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v8;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v33;
      v76 = 2112;
      v77 = (uint64_t)v34;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message, user not found", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[__CFString respondWithError:](v4, "respondWithError:", v17);
  }

}

- (void)_handleAddIssuerKeysToAccessoriesMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "flow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] _handleAddIssuerKeysToAccessoriesMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyAccessoryManager workQueue](v7, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = v7;
  v15 = v5;
  v16 = v4;
  v12 = v4;
  v13 = v5;
  dispatch_async(v11, block);

}

- (void)addIssuerKeysToMatterAccessoriesWithFlow:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  HMDHomeWalletKeyAccessoryManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
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
    objc_msgSend(v4, "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessories", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyAccessoryManager matterAccessoriesSupportingWalletKey](v7, "matterAccessoriesSupportingWalletKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hmf_isEmpty");

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No Matter accessories supporting wallet key, so nothing to add Issuer key to.", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager matterAccessoriesSupportingWalletKey](v7, "matterAccessoriesSupportingWalletKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HMDHomeWalletKeyAccessoryManager addIssuerKeysToMatterAccessories:flow:](v7, "addIssuerKeysToMatterAccessories:flow:", v18, v4);

  }
}

- (id)addIssuerKeysToMatterAccessories:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  HMDHomeWalletKeyAccessoryManager *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = (void *)MEMORY[0x1E0D519C0];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __74__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessories_flow___block_invoke;
  v22 = &unk_1E89BA730;
  v23 = v10;
  v24 = v7;
  v15 = v7;
  objc_msgSend(v6, "na_map:", &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "combineAllFuturesFlatteningArrayResults:", v16, v19, v20, v21, v22, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)addIssuerKeysToMatterAccessory:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterAccessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeWalletKeyAccessoryManager home](v10, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "users");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke;
  v28[3] = &unk_1E89BA758;
  v28[4] = v10;
  v17 = v6;
  v29 = v17;
  v30 = v7;
  v18 = v7;
  objc_msgSend(v15, "na_map:", v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "combineAllFutures:ignoringErrors:scheduler:", v19, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_2;
  v26[3] = &unk_1E89BFD90;
  v27 = v17;
  v23 = v17;
  objc_msgSend(v22, "flatMap:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)addIssuerKeysToMatterTTUAccessoriesForUser:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDHomeWalletKeyAccessoryManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v6;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeysToMatterTTUAccessoriesForUser: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMDHomeWalletKeyAccessoryManager matterAccessoriesSupportingWalletKey](v10, "matterAccessoriesSupportingWalletKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke;
  v23[3] = &unk_1E89BA4A0;
  v23[4] = v10;
  v24 = v6;
  v25 = v7;
  v15 = v7;
  v16 = v6;
  objc_msgSend(v14, "na_map:", v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "combineAllFutures:ignoringErrors:scheduler:", v17, 1, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "flatMap:", &__block_literal_global_204);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__HMDHomeWalletKeyAccessoryManager_addIssuerKeyForUser_toMatterAccessory_flow___block_invoke;
  block[3] = &unk_1E89C1710;
  block[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v13 = v11;
  v24 = v13;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(v12, block);

  v17 = v24;
  v18 = v13;

  return v18;
}

- (id)_addIssuerKeyForUser:(id)a3 toMatterAccessory:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDHomeWalletKeyAccessoryManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v15;
    v31 = 2112;
    v32 = v16;
    v33 = 2112;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addIssuerKeyForUser: %@, toAccessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDHomeWalletKeyAccessoryManager home](v13, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "findOrAddUserIndexForUserUUID:guestName:accessory:flow:", v18, 0, v9, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke;
  v25[3] = &unk_1E89BA8C8;
  v25[4] = v13;
  v26 = v8;
  v27 = v10;
  v28 = v9;
  v20 = v9;
  v21 = v10;
  v22 = v8;
  objc_msgSend(v19, "flatMap:", v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)handleAccessoryCharacteristicsChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  HMDHomeWalletKeyAccessoryManager *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "supportsWalletKey"))
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_arrayForKey:", CFSTR("kModifiedCharacteristicsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_firstObjectPassingTest:", &__block_literal_global_217_151522);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v14;
        v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Handling value update of hardware finish characteristic: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v10, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        objc_msgSend(MEMORY[0x1E0D28580], "untrackedPlaceholderFlow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeWalletKeyAccessoryManager walletKeyColorWithCharacteristicValue:flow:](v12, "walletKeyColorWithCharacteristicValue:flow:", v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[HMDHomeWalletKeyAccessoryManager workQueue](v12, "workQueue");
          v20 = objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke_220;
          v26[3] = &unk_1E89C2328;
          v26[4] = v12;
          v27 = v19;
          dispatch_async(v20, v26);

        }
      }
      else
      {
        v21 = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v12;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v29 = v24;
          v30 = 2112;
          v31 = 0;
          v32 = 2112;
          v33 = v25;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@Hardware finish characteristic value: %@ is not of type data: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v21);
      }

    }
  }

}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeNFCReaderKeyKeychainItemAvailableNotification:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__HMDHomeWalletKeyAccessoryManager_handleHomeNFCReaderKeyKeychainItemAvailableNotification___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleHomeDidDisableCharacteristicNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__HMDHomeWalletKeyAccessoryManager_handleHomeDidDisableCharacteristicNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)handleHomeAddedAccessoryNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDNotificationAddedAccessoryKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__HMDHomeWalletKeyAccessoryManager_handleHomeAddedAccessoryNotification___block_invoke;
    v9[3] = &unk_1E89C2328;
    v9[4] = self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  HMDHomeWalletKeyAccessoryManager *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isWatch");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMDAccessoryNotificationKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (v10)
    {
      objc_msgSend(v4, "object");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v12;

      if (objc_msgSend(v13, "hasAnyAccessoryWithWalletKeySupport"))
      {
        v14 = (void *)MEMORY[0x1D17BA0A0]();
        v15 = self;
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v25 = v17;
          _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Not handling accessory removed notification, home still has an accessory that supports wallet key", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v14);
      }
      else
      {
        objc_msgSend(v4, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hmf_numberForKey:", CFSTR("HMDNotificationSourceKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "unsignedIntegerValue");

        if (v20 == 1)
        {
          -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
          v21 = objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __75__HMDHomeWalletKeyAccessoryManager_handleHomeAccessoryRemovedNotification___block_invoke;
          v22[3] = &unk_1E89C2328;
          v22[4] = self;
          v23 = v13;
          dispatch_async(v21, v22);

        }
      }

    }
  }

}

- (void)handleWalletKeySupportDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDHomeWalletKeyAccessoryManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {
    -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__HMDHomeWalletKeyAccessoryManager_handleWalletKeySupportDidChange___block_invoke;
    v16[3] = &unk_1E89C2328;
    v16[4] = self;
    v17 = v7;
    dispatch_async(v15, v16);

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Not handling wallet key support change for accessory in other home: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)handleHomeUserAddedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HMDHomeWalletKeyAccessoryManager_handleHomeUserAddedNotification___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)matterAccessoriesSupportingWalletKey
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matterAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_filter:", &__block_literal_global_230_151501);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (HMDDevice)primaryResidentDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "residentDeviceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResidentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "capabilities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "supportsWalletKey") & 1) == 0)
  {

    goto LABEL_6;
  }
  v7 = objc_msgSend(v4, "isReachable");

  if (!v7)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v5;
LABEL_7:

  return (HMDDevice *)v8;
}

- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 flow:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(id, void *);
  NSObject *v16;
  void *v17;
  HMDHomeWalletKeyAccessoryManager *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDHomeWalletKeyAccessoryManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDHomeWalletKeyAccessoryManager *v43;
  void *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, void *))a7;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  if (a5 == 1)
  {
    if (objc_msgSend(v13, "length") != 65)
    {
      v17 = (void *)MEMORY[0x1D17BA0A0]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v20;
        v47 = 2112;
        v48 = v21;
        v49 = 2112;
        v50 = v13;
        v51 = 2048;
        v52 = 65;
        v22 = "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, key: %@ must be of le"
              "ngth %lu bytes for HMMTRTapToUnlockType1";
        goto LABEL_17;
      }
LABEL_18:

      objc_autoreleasePoolPop(v17);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v24);
      goto LABEL_28;
    }
  }
  else if (!a5 && objc_msgSend(v13, "length") != 64)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v46 = v20;
      v47 = 2112;
      v48 = v21;
      v49 = 2112;
      v50 = v13;
      v51 = 2048;
      v52 = 64;
      v22 = "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, key: %@ must be of leng"
            "th %lu bytes for Unified Access";
LABEL_17:
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0x2Au);

      goto LABEL_18;
    }
    goto LABEL_18;
  }
  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentUser");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_msgSend(v24, "isOwner");
    -[HMDHomeWalletKeyAccessoryManager primaryResidentDevice](self, "primaryResidentDevice");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26 || (v25 & 1) != 0)
    {
      if (v26)
      {
        -[HMDHomeWalletKeyAccessoryManager requestPrimaryResident:toConfigureAccessories:withDeviceCredentialKey:ofType:flow:completion:](self, "requestPrimaryResident:toConfigureAccessories:withDeviceCredentialKey:ofType:flow:completion:", v26, v12, v13, a5, v14, v15);
      }
      else
      {
        objc_msgSend(v24, "account");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentDevice");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeWalletKeyAccessoryManager configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:](self, "configureAccessories:withDeviceCredentialKey:ofType:forDeviceWithUUID:user:flow:completion:", v12, v13, a5, v36, v24, v14, v15);

        }
        else
        {
          v37 = (void *)MEMORY[0x1D17BA0A0]();
          v38 = self;
          HMFGetOSLogHandle();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v43 = v38;
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "UUID");
            v44 = v37;
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v40;
            v47 = 2112;
            v48 = v41;
            _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure all accessories with device credential key, current device is nil", buf, 0x16u);

            v37 = v44;
            v38 = v43;
          }

          objc_autoreleasePoolPop(v37);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v15[2](v15, v42);

        }
      }
    }
    else
    {
      v28 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation initWithDeviceCredentialKey:accessories:user:]([HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc], "initWithDeviceCredentialKey:accessories:user:", v13, v12, v24);
      -[HMDHomeWalletKeyAccessoryManager pendingPrimaryResidentDeviceCredentialKeyOperation](self, "pendingPrimaryResidentDeviceCredentialKeyOperation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[HMDHomeWalletKeyAccessoryManager pendingPrimaryResidentDeviceCredentialKeyOperation](self, "pendingPrimaryResidentDeviceCredentialKeyOperation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "operationByMergingWithOperation:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeWalletKeyAccessoryManager setPendingPrimaryResidentDeviceCredentialKeyOperation:](self, "setPendingPrimaryResidentDeviceCredentialKeyOperation:", v31);

      }
      else
      {
        -[HMDHomeWalletKeyAccessoryManager setPendingPrimaryResidentDeviceCredentialKeyOperation:](self, "setPendingPrimaryResidentDeviceCredentialKeyOperation:", v28);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, v33);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, v32);

    v24 = 0;
  }
LABEL_28:

}

- (void)requestPrimaryResident:(id)a3 toConfigureAccessories:(id)a4 withDeviceCredentialKey:(id)a5 ofType:(int64_t)a6 flow:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *);
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHomeWalletKeyAccessoryManager *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  HMDRemoteDeviceMessageDestination *v25;
  HMDRemoteDeviceMessageDestination *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  HMDRemoteMessage *v32;
  void *v33;
  HMDHomeWalletKeyAccessoryManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void (**v41)(id, void *);
  id v42;
  id v43;
  id v44;
  _QWORD v45[5];
  void (**v46)(id, void *);
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  HMDRemoteMessage *v52;
  __int16 v53;
  id v54;
  _QWORD v55[4];
  _QWORD v56[6];

  v56[4] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v44 = a5;
  v16 = a7;
  v17 = (void (**)(id, void *))a8;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  objc_msgSend(v15, "na_map:", &__block_literal_global_234);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "hmf_isEmpty"))
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v23;
      v49 = 2112;
      v50 = v24;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Did not send message to configure all accessories with device credential key, accessory uuids is empty", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v25 = (HMDRemoteDeviceMessageDestination *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v25);
  }
  else
  {
    v26 = [HMDRemoteDeviceMessageDestination alloc];
    -[HMDHomeWalletKeyAccessoryManager messageTargetUUID](self, "messageTargetUUID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v14;
    v25 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v26, "initWithTarget:device:", v27, v14);

    v56[0] = v44;
    v55[0] = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyCredentialKey");
    v55[1] = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyTapToUnlockType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v56[1] = v28;
    v56[2] = v19;
    v29 = *MEMORY[0x1E0D28010];
    v55[2] = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyAccessoryUUIDs");
    v55[3] = v29;
    HMFEncodedRootObject();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56[3] = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[HMDRemoteMessage initWithName:destination:payload:type:timeout:secure:]([HMDRemoteMessage alloc], "initWithName:destination:payload:type:timeout:secure:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessage"), v25, v31, 0, 1, 0.0);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_237;
    v45[3] = &unk_1E89BE018;
    v45[4] = self;
    v46 = v17;
    v33 = (void *)MEMORY[0x1D17BA0A0](-[HMDRemoteMessage setResponseHandler:](v32, "setResponseHandler:", v45));
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = v15;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUID");
      v41 = v17;
      v37 = v31;
      v38 = v16;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v48 = v36;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = v32;
      v53 = 2112;
      v54 = v43;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Sending message to configure device credential key: %@ to primary resident: %@", buf, 0x2Au);

      v16 = v38;
      v31 = v37;
      v17 = v41;

      v15 = v42;
    }

    objc_autoreleasePoolPop(v33);
    -[HMDHomeWalletKeyAccessoryManager messageDispatcher](v34, "messageDispatcher");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sendMessage:", v32);

    v14 = v43;
  }

}

- (void)fetchOrConfigureNFCReaderKeyForAccessory:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDHomeWalletKeyAccessoryManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v15;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] fetchOrConfigureNFCReaderKeyForAccessory: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDHomeWalletKeyAccessoryManager home](v13, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "currentUser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "isOwner");

  objc_msgSend(v17, "nfcReaderKeyManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke;
  v23[3] = &unk_1E89BA9C0;
  v23[4] = v13;
  v24 = v9;
  v25 = v8;
  v26 = v10;
  v20 = v8;
  v21 = v10;
  v22 = v9;
  objc_msgSend(v19, "fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:", 1, v22, v23);

}

- (id)configureNFCReaderKeyOnMatterAccessory:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyAccessoryManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "supportsCHIP") & 1) != 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HMDHomeWalletKeyAccessoryManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "nfcReaderKeyManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyOnMatterAccessory_flow___block_invoke;
    v22[3] = &unk_1E89BA9E8;
    v22[4] = self;
    v23 = v7;
    v11 = v8;
    v24 = v11;
    v25 = v6;
    objc_msgSend(v10, "fetchOrCreateReaderKeyWithRequiresPrivateKey:flow:completion:", 1, v23, v22);

    v12 = v25;
    v13 = v11;

    v14 = v13;
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
      objc_msgSend(v7, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring NFC Reader key on non-matter accessory: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v20 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 93);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)fetchIsAccessoryConfiguredWithReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  HMDHomeWalletKeyAccessoryManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HMDHomeWalletKeyAccessoryManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDHomeWalletKeyAccessoryManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  HMDHomeWalletKeyAccessoryManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDHomeWalletKeyAccessoryManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDHomeWalletKeyAccessoryManager *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *context;
  void *contexta;
  void *contextb;
  __CFString *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  __CFString *v82;
  id v83;
  id v84;
  id v85;
  id location;
  id v87;
  void *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  const __CFString *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v77 = (__CFString *)a3;
  v10 = a4;
  v78 = a5;
  v11 = a6;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    -[__CFString currentUser](v13, "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "isOwner");

    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v90 = v19;
      v91 = 2112;
      v92 = v20;
      v93 = 2112;
      v94 = v21;
      v95 = 2112;
      v96 = v77;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching accessory is configured with nfc reader key %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v10, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString uuid](v14, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v10, "findServiceWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        -[__CFString findCharacteristicWithType:](v26, "findCharacteristicWithType:", CFSTR("00000264-0000-1000-8000-0026BB765291"));
        context = (void *)objc_claimAutoreleasedReturnValue();
        if (context)
        {
          v71 = objc_alloc_init(MEMORY[0x1E0D16578]);
          v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16570]), "initWithValue:", 1);
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16550]), "initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:", v70, 0, 0, 0, 0, v71, 0);
          v87 = 0;
          objc_msgSend(v69, "serializeWithError:", &v87);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (__CFString *)v87;
          if (v68)
          {
            +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", context, v68, 0, 0, 0, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = v67;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDHomeWalletKeyAccessoryManager dataSource](v17, "dataSource");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "accessoryWriteMaxRetryCount");
            -[HMDHomeWalletKeyAccessoryManager dataSource](v17, "dataSource");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "accessoryWriteRetryInterval");
            -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v14, "performWriteRequests:withRetries:timeInterval:loggingObject:", v28, v30, v17);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            objc_initWeak((id *)buf, v17);
            objc_initWeak(&location, v10);
            v32 = (void *)MEMORY[0x1E0D519E8];
            -[HMDHomeWalletKeyAccessoryManager workQueue](v17, "workQueue");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "schedulerWithDispatchQueue:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "reschedule:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v79[0] = MEMORY[0x1E0C809B0];
            v79[1] = 3221225472;
            v79[2] = __102__HMDHomeWalletKeyAccessoryManager_fetchIsAccessoryConfiguredWithReaderKey_accessory_flow_completion___block_invoke;
            v79[3] = &unk_1E89BAA10;
            objc_copyWeak(&v84, (id *)buf);
            objc_copyWeak(&v85, &location);
            v80 = v78;
            v83 = v11;
            v81 = context;
            v82 = v77;
            v36 = (id)objc_msgSend(v35, "addCompletionBlock:", v79);

            objc_destroyWeak(&v85);
            objc_destroyWeak(&v84);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);

          }
          else
          {
            v59 = (void *)MEMORY[0x1D17BA0A0]();
            v60 = v17;
            HMFGetOSLogHandle();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "UUID");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "shortDescription");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v90 = v62;
              v91 = 2112;
              v92 = v63;
              v93 = 2112;
              v94 = v64;
              v95 = 2112;
              v96 = 0;
              v97 = 2112;
              v98 = v66;
              _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, unable to encode nfc access control %@:%@", buf, 0x34u);

            }
            objc_autoreleasePoolPop(v59);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v67);
          }

        }
        else
        {
          v72 = (void *)MEMORY[0x1D17BA0A0]();
          v54 = v17;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "UUID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "shortDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v90 = v56;
            v91 = 2112;
            v92 = v57;
            v93 = 2112;
            v94 = v58;
            v95 = 2112;
            v96 = v27;
            v97 = 2112;
            v98 = CFSTR("00000264-0000-1000-8000-0026BB765291");
            _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v72);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v73);

        }
      }
      else
      {
        contexta = (void *)MEMORY[0x1D17BA0A0]();
        v49 = v17;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "UUID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "shortDescription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v90 = v51;
          v91 = 2112;
          v92 = v52;
          v93 = 2112;
          v94 = v53;
          v95 = 2112;
          v96 = CFSTR("00000266-0000-1000-8000-0026BB765291");
          _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, it doesn't support nfc access service %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(contexta);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        contextb = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, contextb);

      }
    }
    else
    {
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = v17;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "UUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "home");
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v90 = v45;
        v91 = 2112;
        v92 = v46;
        v93 = 2112;
        v94 = v47;
        v95 = 2112;
        v96 = v48;
        v97 = 2112;
        v98 = v14;
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v42);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, __CFString *))v11 + 2))(v11, 0, 0, v27);
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v40;
      v91 = 2112;
      v92 = v41;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch accessory is configured for wallet key, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, __CFString *))v11 + 2))(v11, 0, 0, v27);
  }

}

- (void)removeNfcReaderKeyWithIdentifier:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  HMDHomeWalletKeyAccessoryManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  HMDHomeWalletKeyAccessoryManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDHomeWalletKeyAccessoryManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  HMDHomeWalletKeyAccessoryManager *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  HMDHomeWalletKeyAccessoryManager *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  HMDHomeWalletKeyAccessoryManager *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *context;
  void *contexta;
  void *contextb;
  __CFString *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id location;
  id v86;
  void *v87;
  uint8_t buf[4];
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  const __CFString *v95;
  __int16 v96;
  const __CFString *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v77 = (__CFString *)a3;
  v10 = a4;
  v78 = a5;
  v11 = a6;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    -[__CFString currentUser](v13, "currentUser");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "isOwner");

    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v89 = v19;
      v90 = 2112;
      v91 = v20;
      v92 = 2112;
      v93 = v21;
      v94 = 2112;
      v95 = v77;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing nfc reader key with identifier from accessory %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v10, "home");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString uuid](v14, "uuid");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v10, "findServiceWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        -[__CFString findCharacteristicWithType:](v26, "findCharacteristicWithType:", CFSTR("00000264-0000-1000-8000-0026BB765291"));
        context = (void *)objc_claimAutoreleasedReturnValue();
        if (context)
        {
          v71 = objc_alloc_init(MEMORY[0x1E0D16578]);
          objc_msgSend(v71, "setIdentifier:", v77);
          v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16570]), "initWithValue:", 3);
          v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16550]), "initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:", v70, 0, 0, 0, 0, v71, 0);
          v86 = 0;
          objc_msgSend(v69, "serializeWithError:", &v86);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = (__CFString *)v86;
          if (v68)
          {
            +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", context, v68, 0, 0, 0, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = v67;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDHomeWalletKeyAccessoryManager dataSource](v17, "dataSource");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "accessoryWriteMaxRetryCount");
            -[HMDHomeWalletKeyAccessoryManager dataSource](v17, "dataSource");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "accessoryWriteRetryInterval");
            -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v14, "performWriteRequests:withRetries:timeInterval:loggingObject:", v28, v30, v17);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            objc_initWeak((id *)buf, v17);
            objc_initWeak(&location, v10);
            v32 = (void *)MEMORY[0x1E0D519E8];
            -[HMDHomeWalletKeyAccessoryManager workQueue](v17, "workQueue");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "schedulerWithDispatchQueue:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "reschedule:", v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v79[0] = MEMORY[0x1E0C809B0];
            v79[1] = 3221225472;
            v79[2] = __95__HMDHomeWalletKeyAccessoryManager_removeNfcReaderKeyWithIdentifier_accessory_flow_completion___block_invoke;
            v79[3] = &unk_1E89BAA38;
            objc_copyWeak(&v83, (id *)buf);
            objc_copyWeak(&v84, &location);
            v80 = v78;
            v82 = v11;
            v81 = context;
            v36 = (id)objc_msgSend(v35, "addCompletionBlock:", v79);

            objc_destroyWeak(&v84);
            objc_destroyWeak(&v83);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);

          }
          else
          {
            v59 = (void *)MEMORY[0x1D17BA0A0]();
            v60 = v17;
            HMFGetOSLogHandle();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "UUID");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "shortDescription");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v89 = v62;
              v90 = 2112;
              v91 = v63;
              v92 = 2112;
              v93 = v64;
              v94 = 2112;
              v95 = 0;
              v96 = 2112;
              v97 = v66;
              _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, unable to encode nfc access control %@:%@", buf, 0x34u);

            }
            objc_autoreleasePoolPop(v59);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v11 + 2))(v11, v67);
          }

        }
        else
        {
          v72 = (void *)MEMORY[0x1D17BA0A0]();
          v54 = v17;
          HMFGetOSLogHandle();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "UUID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "shortDescription");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v89 = v56;
            v90 = 2112;
            v91 = v57;
            v92 = 2112;
            v93 = v58;
            v94 = 2112;
            v95 = v27;
            v96 = 2112;
            v97 = CFSTR("00000264-0000-1000-8000-0026BB765291");
            _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v72);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *))v11 + 2))(v11, v73);

        }
      }
      else
      {
        contexta = (void *)MEMORY[0x1D17BA0A0]();
        v49 = v17;
        HMFGetOSLogHandle();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "UUID");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "shortDescription");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v89 = v51;
          v90 = 2112;
          v91 = v52;
          v92 = 2112;
          v93 = v53;
          v94 = 2112;
          v95 = CFSTR("00000266-0000-1000-8000-0026BB765291");
          _os_log_impl(&dword_1CD062000, v50, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, it doesn't support nfc access service %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(contexta);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
        contextb = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v11 + 2))(v11, contextb);

      }
    }
    else
    {
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      v43 = v17;
      HMFGetOSLogHandle();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "UUID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "home");
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v89 = v45;
        v90 = 2112;
        v91 = v46;
        v92 = 2112;
        v93 = v47;
        v94 = 2112;
        v95 = v48;
        v96 = 2112;
        v97 = v14;
        _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v42);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, __CFString *))v11 + 2))(v11, v27);
    }
  }
  else
  {
    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "UUID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v89 = v40;
      v90 = 2112;
      v91 = v41;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from accessory, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, __CFString *))v11 + 2))(v11, v27);
  }

}

- (void)configureAccessoryWithNfcReaderKey:(id)a3 accessory:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  HMDHomeWalletKeyAccessoryManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  HMDHomeWalletKeyAccessoryManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  int v31;
  void *v32;
  HMDHomeWalletKeyAccessoryManager *v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  HMDHomeWalletKeyAccessoryManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  HMDHomeWalletKeyAccessoryManager *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  __CFString *v80;
  void *v81;
  HMDHomeWalletKeyAccessoryManager *v82;
  NSObject *v83;
  void *v84;
  __CFString *v85;
  HMDHomeWalletKeyAccessoryManager *v86;
  NSObject *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  void *v91;
  HMDHomeWalletKeyAccessoryManager *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  __CFString *v96;
  void *v97;
  __CFString *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __CFString *v103;
  id v104;
  void *v105;
  void *v106;
  void *context;
  void *contexta;
  void *contextb;
  void *contextc;
  void (**v111)(id, id);
  __CFString *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  id v116;
  void (**v117)(id, id);
  id v118;
  id v119;
  id location;
  id v121;
  _QWORD v122[5];
  id v123;
  void (**v124)(id, id);
  _QWORD v125[5];
  id v126;
  __CFString *v127;
  id v128;
  void (**v129)(id, id);
  _QWORD v130[4];
  id v131;
  id v132;
  id v133;
  void *v134;
  uint8_t buf[4];
  void *v136;
  __int16 v137;
  void *v138;
  __int16 v139;
  __CFString *v140;
  __int16 v141;
  const __CFString *v142;
  __int16 v143;
  const __CFString *v144;
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v112 = (__CFString *)a3;
  v10 = a4;
  v113 = a5;
  v111 = (void (**)(id, id))a6;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v136 = v15;
    v137 = 2112;
    v138 = v16;
    v139 = 2112;
    v140 = v112;
    v141 = 2112;
    v142 = v17;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] configureAccessoryWithNfcReaderKey: %@, accessory: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v12);
  -[HMDHomeWalletKeyAccessoryManager home](v13, "home");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = v13;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "UUID");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v136 = v54;
      v137 = 2112;
      v138 = v55;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with nfc reader key, home is nil", buf, 0x16u);

    }
    goto LABEL_14;
  }
  -[__CFString currentUser](v18, "currentUser");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "isOwner");

  v21 = (void *)MEMORY[0x1D17BA0A0]();
  v22 = v13;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v136 = v24;
    v137 = 2112;
    v138 = v25;
    v139 = 2112;
    v140 = v26;
    v141 = 2112;
    v142 = v112;
    _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessory with nfc reader key %@:%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(v10, "home");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString uuid](v19, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqual:", v29);

  if ((v30 & 1) == 0)
  {
    v51 = (void *)MEMORY[0x1D17BA0A0]();
    v52 = v22;
    HMFGetOSLogHandle();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "UUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortDescription");
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "home");
      v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v136 = v56;
      v137 = 2112;
      v138 = v57;
      v139 = 2112;
      v140 = v58;
      v141 = 2112;
      v142 = v59;
      v143 = 2112;
      v144 = v19;
      _os_log_impl(&dword_1CD062000, v53, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, its home: %@ doesn't match current home: %@", buf, 0x34u);

    }
LABEL_14:

    objc_autoreleasePoolPop(v51);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v111[2](v111, v38);
    goto LABEL_39;
  }
  v31 = objc_msgSend(v10, "supportsCHIP");
  v32 = (void *)MEMORY[0x1D17BA0A0]();
  v33 = v22;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
  if (v31)
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "UUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v136 = v36;
      v137 = 2112;
      v138 = v37;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for Matter accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    v38 = (__CFString *)objc_alloc_init(MEMORY[0x1E0D165B0]);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16568]), "initWithValue:", 2);
    -[__CFString setType:](v38, "setType:", v39);

    -[__CFString privateKey](v112, "privateKey");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setKey:](v38, "setKey:", v40);

    objc_msgSend(v10, "nfcReaderIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setKeyIdentifier:](v38, "setKeyIdentifier:", v41);

    objc_msgSend(v10, "nfcReaderIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString setReaderIdentifier:](v38, "setReaderIdentifier:", v42);

    v43 = objc_alloc_init(MEMORY[0x1E0D16518]);
    objc_msgSend(v43, "setReaderKey:", v38);
    objc_msgSend(v10, "uuid");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyAccessoryManager startHomeWalletKeyAddForAccessoryUUID:keyType:expectedCount:](v33, "startHomeWalletKeyAddForAccessoryUUID:keyType:expectedCount:", v44, 0, 1);

    v133 = 0;
    objc_msgSend(v43, "serializeWithError:", &v133);
    context = (void *)objc_claimAutoreleasedReturnValue();
    v103 = (__CFString *)v133;
    if (context)
    {
      objc_msgSend(v10, "waitForDoorLockClusterObjectWithFlow:", v113);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = MEMORY[0x1E0C809B0];
      v130[0] = MEMORY[0x1E0C809B0];
      v130[1] = 3221225472;
      v130[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke;
      v130[3] = &unk_1E89BAA60;
      v131 = context;
      v47 = v113;
      v132 = v47;
      objc_msgSend(v45, "then:", v130);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v46;
      v125[1] = 3221225472;
      v125[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2;
      v125[3] = &unk_1E89BAA88;
      v125[4] = v33;
      v126 = v47;
      v127 = v112;
      v128 = v10;
      v129 = v111;
      v122[0] = v46;
      v122[1] = 3221225472;
      v122[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_251;
      v122[3] = &unk_1E89BAAB0;
      v122[4] = v33;
      v123 = v126;
      v124 = v129;
      v49 = (id)objc_msgSend(v48, "then:orRecover:", v125, v122);

      v50 = v131;
    }
    else
    {
      v81 = (void *)MEMORY[0x1D17BA0A0]();
      v82 = v33;
      HMFGetOSLogHandle();
      v83 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "UUID");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v136 = v102;
        v137 = 2112;
        v138 = v84;
        v139 = 2112;
        v140 = v85;
        v141 = 2112;
        v142 = 0;
        v143 = 2112;
        v144 = v103;
        _os_log_impl(&dword_1CD062000, v83, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to encode matter credential %@:%@", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v81);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1002);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v111[2](v111, v50);
    }

  }
  else
  {
    if (v35)
    {
      HMFGetLogIdentifier();
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "UUID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v136 = v60;
      v137 = 2112;
      v138 = v61;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring NFC reader key for HAP accessory", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(v10, "findServiceWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"));
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v38 = v62;
    if (v62)
    {
      -[__CFString findCharacteristicWithType:](v62, "findCharacteristicWithType:", CFSTR("00000264-0000-1000-8000-0026BB765291"));
      contexta = (void *)objc_claimAutoreleasedReturnValue();
      if (contexta)
      {
        v104 = objc_alloc_init(MEMORY[0x1E0D16578]);
        -[__CFString privateKey](v112, "privateKey");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setKey:", v63);

        v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16568]), "initWithValue:", 2);
        objc_msgSend(v104, "setType:", v64);

        objc_msgSend(v10, "nfcReaderIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setReaderIdentifier:", v65);

        v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16570]), "initWithValue:", 2);
        v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16550]), "initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:", v101, 0, 0, 0, 0, v104, 0);
        v121 = 0;
        objc_msgSend(v100, "serializeWithError:", &v121);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = (__CFString *)v121;
        if (v99)
        {
          +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", contexta, v99, 0, 0, 0, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v134 = v66;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDHomeWalletKeyAccessoryManager dataSource](v33, "dataSource");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = objc_msgSend(v68, "accessoryWriteMaxRetryCount");
          -[HMDHomeWalletKeyAccessoryManager dataSource](v33, "dataSource");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "accessoryWriteRetryInterval");
          -[__CFString performWriteRequests:withRetries:timeInterval:loggingObject:](v19, "performWriteRequests:withRetries:timeInterval:loggingObject:", v67, v69, v33);
          v97 = (void *)objc_claimAutoreleasedReturnValue();

          objc_initWeak((id *)buf, v33);
          objc_initWeak(&location, v10);
          v71 = (void *)MEMORY[0x1E0D519E8];
          -[HMDHomeWalletKeyAccessoryManager workQueue](v33, "workQueue");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "schedulerWithDispatchQueue:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "reschedule:", v73);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = MEMORY[0x1E0C809B0];
          v114[1] = 3221225472;
          v114[2] = __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_253;
          v114[3] = &unk_1E89BAA38;
          objc_copyWeak(&v118, (id *)buf);
          objc_copyWeak(&v119, &location);
          v115 = v113;
          v117 = v111;
          v116 = contexta;
          v75 = (id)objc_msgSend(v74, "addCompletionBlock:", v114);

          objc_destroyWeak(&v119);
          objc_destroyWeak(&v118);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);

        }
        else
        {
          v91 = (void *)MEMORY[0x1D17BA0A0]();
          v92 = v33;
          HMFGetOSLogHandle();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "UUID");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "shortDescription");
            v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v136 = v94;
            v137 = 2112;
            v138 = v95;
            v139 = 2112;
            v140 = v96;
            v141 = 2112;
            v142 = 0;
            v143 = 2112;
            v144 = v98;
            _os_log_impl(&dword_1CD062000, v93, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to encode nfc access control %@:%@", buf, 0x34u);

          }
          objc_autoreleasePoolPop(v91);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v111[2](v111, v66);
        }

      }
      else
      {
        v105 = (void *)MEMORY[0x1D17BA0A0]();
        v86 = v33;
        HMFGetOSLogHandle();
        v87 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "UUID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "shortDescription");
          v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v136 = v88;
          v137 = 2112;
          v138 = v89;
          v139 = 2112;
          v140 = v90;
          v141 = 2112;
          v142 = v38;
          v143 = 2112;
          v144 = CFSTR("00000264-0000-1000-8000-0026BB765291");
          _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);

        }
        objc_autoreleasePoolPop(v105);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v111[2](v111, v106);

      }
    }
    else
    {
      contextb = (void *)MEMORY[0x1D17BA0A0]();
      v76 = v33;
      HMFGetOSLogHandle();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "UUID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "shortDescription");
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v136 = v78;
        v137 = 2112;
        v138 = v79;
        v139 = 2112;
        v140 = v80;
        v141 = 2112;
        v142 = CFSTR("00000266-0000-1000-8000-0026BB765291");
        _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, it doesn't support nfc access service %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(contextb);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      contextc = (void *)objc_claimAutoreleasedReturnValue();
      v111[2](v111, contextc);

    }
  }
LABEL_39:

}

- (void)unregisterForNotificationsWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDHomeWalletKeyAccessoryManager *v7;
  NSObject *v8;
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
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
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
    v17 = 138543618;
    v18 = v9;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Unregistering for notifications with reason: %@", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDHomeWalletKeyAccessoryManager home](v7, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", v7, CFSTR("HMDAccessoryConnectedNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", v7, CFSTR("HMDAccessorySupportsWalletKeyDidChangeNotification"), 0);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nfcReaderKeyManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:name:object:", v7, CFSTR("HMDHomeNFCReaderKeyKeychainItemAvailableNotification"), v14);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:name:object:", v7, CFSTR("HMDNotificationHomeAddedAccessory"), v10);

  -[HMDHomeWalletKeyAccessoryManager notificationCenter](v7, "notificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeObserver:name:object:", v7, CFSTR("HMDHomeUserAddedNotification"), v10);

}

- (void)configureAccessories:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  HMDHomeWalletKeyAccessoryManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferenceForKey:", CFSTR("HMDHomeWalletKeyAccessoryManagerDisableAddingDeviceKeys"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUID");
      v28 = v23;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Not adding device credential key because HMDHomeWalletKeyAccessoryManagerDisableAddingDeviceKeys is set", buf, 0x16u);

      v23 = v28;
    }

    objc_autoreleasePoolPop(v23);
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager configureAccessories_HH1:withDeviceCredentialKey:forDeviceWithUUID:user:flow:completion:](self, "configureAccessories_HH1:withDeviceCredentialKey:forDeviceWithUUID:user:flow:completion:", v14, v15, v16, v17, v18, v19);
  }

}

- (void)configureAccessories_HH1:(id)a3 withDeviceCredentialKey:(id)a4 forDeviceWithUUID:(id)a5 user:(id)a6 flow:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeWalletKeyAccessoryManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  HMDHomeWalletKeyAccessoryManager *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHomeWalletKeyAccessoryManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v52 = a4;
  v50 = a5;
  v51 = a6;
  v15 = a7;
  v16 = a8;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentUser");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "isOwner");

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (objc_msgSend(v14, "count"))
    {
      v21 = (void *)MEMORY[0x1D17BA0A0](-[HMDHomeWalletKeyAccessoryManager createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:deviceCredentialKey:user:deviceUUID:](self, "createAccessoryDeviceCredentialKeyPendingOperationWithAccessories:deviceCredentialKey:user:deviceUUID:", v14, v52, v51, v50));
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v63 = v24;
        v64 = 2112;
        v65 = v25;
        v66 = 2112;
        v67 = v14;
        v68 = 2112;
        v69 = v52;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessories with device credential key HH1 %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
      -[HMDHomeWalletKeyAccessoryManager writeRequestsWithAccessories:home:deviceCredentialKey:user:flow:](v22, "writeRequestsWithAccessories:home:deviceCredentialKey:user:flow:", v14, v20, v52, v51, v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "count"))
      {
        v27 = objc_msgSend(v26, "count");
        if (v27 == objc_msgSend(v14, "count"))
        {
          v48 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2008);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v26, "allObjects");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeWalletKeyAccessoryManager dataSource](v22, "dataSource");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "accessoryWriteMaxRetryCount");
        -[HMDHomeWalletKeyAccessoryManager dataSource](v22, "dataSource");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "accessoryWriteRetryInterval");
        objc_msgSend(v20, "performWriteRequests:withRetries:timeInterval:loggingObject:", v39, v41, v22);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak((id *)buf, v22);
        v43 = (void *)MEMORY[0x1E0D519E8];
        -[HMDHomeWalletKeyAccessoryManager workQueue](v22, "workQueue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "schedulerWithDispatchQueue:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "reschedule:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __124__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH1_withDeviceCredentialKey_forDeviceWithUUID_user_flow_completion___block_invoke;
        v53[3] = &unk_1E89BAAD8;
        objc_copyWeak(&v61, (id *)buf);
        v54 = v15;
        v60 = v16;
        v55 = v50;
        v56 = v52;
        v57 = v26;
        v58 = v51;
        v38 = v48;
        v59 = v38;
        v47 = (id)objc_msgSend(v46, "addCompletionBlock:", v53);

        objc_destroyWeak(&v61);
        objc_destroyWeak((id *)buf);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id))v16 + 2))(v16, v38);
      }

    }
    else
    {
      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = self;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "UUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v63 = v36;
        v64 = 2112;
        v65 = v37;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessories with device credential key, accessories count is 0", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v26);
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v63 = v31;
      v64 = 2112;
      v65 = v32;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v16 + 2))(v16, v26);
  }

}

- (void)configureAccessories_HH2:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forDeviceWithUUID:(id)a6 user:(id)a7 flow:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  void (**v17)(id, void *);
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDHomeWalletKeyAccessoryManager *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void (**v33)(id, void *);
  void *v34;
  void *v35;
  HMDHomeWalletKeyAccessoryManager *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  HMDHomeWalletKeyAccessoryManager *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void (**v65)(id, void *);
  void *v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *v70;
  HMDHomeWalletKeyAccessoryManager *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  void (**v82)(id, void *);
  _QWORD v83[4];
  void (**v84)(id, void *);
  _QWORD v85[4];
  id v86;
  _QWORD v87[5];
  id v88;
  id v89;
  id v90;
  int64_t v91;
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  void *v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v79 = a4;
  v16 = a6;
  v78 = a7;
  v80 = a8;
  v17 = (void (**)(id, void *))a9;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v18);

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentUser");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "isOwner");

  -[HMDHomeWalletKeyAccessoryManager home](self, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v35 = (void *)MEMORY[0x1D17BA0A0]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v38;
      v94 = 2112;
      v95 = v39;
      _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, home is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = -1;
    goto LABEL_13;
  }
  if (!objc_msgSend(v15, "count"))
  {
    v42 = (void *)MEMORY[0x1D17BA0A0]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "UUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v93 = v45;
      v94 = 2112;
      v95 = v46;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessories with device credential key, accessories count is 0", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v42);
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v41 = 3;
LABEL_13:
    objc_msgSend(v40, "hmErrorWithCode:", v41);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v47);
    goto LABEL_20;
  }
  v75 = v16;
  objc_msgSend(v15, "na_filter:", &__block_literal_global_269);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v15;
  objc_msgSend(v15, "na_filter:", &__block_literal_global_270);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1D17BA0A0]();
  v25 = self;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  v77 = v23;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v93 = v27;
    v94 = 2112;
    v95 = v28;
    v96 = 2112;
    v97 = (uint64_t)v76;
    v98 = 2112;
    v99 = (uint64_t)v79;
    v100 = 2112;
    v101 = v22;
    v102 = 2112;
    v103 = v77;
    _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring accessories with device credential key HH2. accessories: %@, deviceCredentialKey: %@, hapAccessories: %@, matterAccessories: %@", buf, 0x3Eu);

    v23 = v77;
  }

  objc_autoreleasePoolPop(v24);
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_271;
  v87[3] = &unk_1E89BAB40;
  v87[4] = v25;
  v29 = v79;
  v88 = v29;
  v91 = a5;
  v30 = v78;
  v89 = v30;
  v31 = v80;
  v90 = v31;
  objc_msgSend(v23, "na_map:", v87);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v22;
  v74 = v21;
  if (a5)
  {
    v33 = v17;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager writeRequestsWithAccessories:home:deviceCredentialKey:user:flow:](v25, "writeRequestsWithAccessories:home:deviceCredentialKey:user:flow:", v22, v21, v29, v30, v31);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "allObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeWalletKeyAccessoryManager performHAPWriteRequestsHH2:home:flow:](v25, "performHAPWriteRequestsHH2:home:flow:", v49, v21, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_msgSend(v48, "count");
    if (v50 != objc_msgSend(v22, "count"))
    {
      v51 = (void *)MEMORY[0x1D17BA0A0]();
      v71 = v25;
      HMFGetOSLogHandle();
      v70 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "UUID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v51;
        v53 = objc_msgSend(v22, "count");
        v54 = v53 - objc_msgSend(v48, "count");
        v55 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 138544130;
        v93 = v69;
        v94 = 2112;
        v95 = v52;
        v96 = 2048;
        v97 = v54;
        v51 = v68;
        v98 = 2048;
        v99 = v55;
        _os_log_impl(&dword_1CD062000, v70, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to create a write request for a subset of the HAP accessories (%lu of the %lu HAP accessories)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v51);
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_273;
      v85[3] = &unk_1E89BAB68;
      v86 = v48;
      v56 = (id)objc_msgSend(v34, "flatMap:", v85);

    }
    v33 = v17;

  }
  v72 = v32;
  objc_msgSend(v32, "arrayByAddingObject:", v34);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)MEMORY[0x1E0D519E8];
  -[HMDHomeWalletKeyAccessoryManager workQueue](v25, "workQueue");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "schedulerWithDispatchQueue:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "reschedule:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = MEMORY[0x1E0C809B0];
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2_275;
  v83[3] = &unk_1E89BD348;
  v64 = v34;
  v65 = v33;
  v84 = v65;
  objc_msgSend(v62, "addSuccessBlock:", v83);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v63;
  v17 = v33;
  v81[1] = 3221225472;
  v81[2] = __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_3;
  v81[3] = &unk_1E89C1A48;
  v82 = v65;
  v67 = (id)objc_msgSend(v66, "addFailureBlock:", v81);

  v16 = v75;
  v15 = v76;
  v47 = v73;
  v21 = v74;
LABEL_20:

}

- (id)performHAPWriteRequestsHH2:(id)a3 home:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "hmf_isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "accessoryWriteMaxRetryCount");
    -[HMDHomeWalletKeyAccessoryManager dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessoryWriteRetryInterval");
    objc_msgSend(v9, "performWriteRequests:withRetries:timeInterval:loggingObject:", v8, v13, self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v16 = (void *)MEMORY[0x1E0D519E8];
    -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "schedulerWithDispatchQueue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reschedule:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__HMDHomeWalletKeyAccessoryManager_performHAPWriteRequestsHH2_home_flow___block_invoke;
    v21[3] = &unk_1E89BAB90;
    objc_copyWeak(&v24, &location);
    v22 = v10;
    v23 = v8;
    objc_msgSend(v19, "flatMap:", v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v11;
}

- (id)configureMatterAccessory:(id)a3 withDeviceCredentialKey:(id)a4 ofType:(int64_t)a5 forUser:(id)a6 flow:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDHomeWalletKeyAccessoryManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHomeWalletKeyAccessoryManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDHomeWalletKeyAccessoryManager *v41;
  void *v42;
  void *v43;
  HMDHomeWalletKeyAccessoryManager *v45;
  void *v46;
  NSObject *log;
  id v48;
  id v49;
  HMDHomeWalletKeyAccessoryManager *v50;
  HMDHomeWalletKeyAccessoryManager *v51;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  HMDHomeWalletKeyAccessoryManager *v57;
  id v58;
  int64_t v59;
  id v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v50 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v21 = v14;
    v22 = v11;
    v23 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v62 = v18;
    v63 = 2112;
    v64 = v19;
    v65 = 2112;
    v66 = v20;
    v67 = 2112;
    v68 = v12;
    v69 = 2112;
    v70 = v24;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Configuring Matter accessory with device credential key. accessory: %@, deviceCredentialKey: %@ forUser: %@", buf, 0x34u);

    v13 = v23;
    v11 = v22;
    v14 = v21;

    v16 = v50;
  }

  objc_autoreleasePoolPop(v15);
  v25 = v12;
  v26 = v25;
  if (a5)
    goto LABEL_10;
  v51 = v16;
  v48 = v13;
  v27 = objc_alloc_init(MEMORY[0x1E0D164D8]);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16568]), "initWithValue:", 2);
  objc_msgSend(v27, "setType:", v28);

  objc_msgSend(v27, "setKey:", v25);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16560]), "initWithValue:", 1);
  objc_msgSend(v27, "setState:", v29);

  v30 = objc_alloc_init(MEMORY[0x1E0D16518]);
  objc_msgSend(v30, "setDeviceCredentialKey:", v27);
  v60 = 0;
  objc_msgSend(v30, "serializeWithError:", &v60);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v60;
  if (v31)
  {
    v26 = v31;
    v32 = v25;
  }
  else
  {
    v33 = (void *)MEMORY[0x1D17BA0A0]();
    v34 = v51;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUID");
      log = v35;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v46 = v33;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v62 = v36;
      v63 = 2112;
      v64 = v37;
      v65 = 2112;
      v66 = v38;
      v67 = 2112;
      v68 = 0;
      v69 = 2112;
      v70 = v49;
      _os_log_impl(&dword_1CD062000, log, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to encode matter credential %@:%@", buf, 0x34u);

      v33 = v46;
      v35 = log;

      v34 = v45;
    }

    objc_autoreleasePoolPop(v33);
    v39 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "futureWithError:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
  }

  v13 = v48;
  v16 = v51;
  if (v31)
  {
LABEL_10:
    -[HMDHomeWalletKeyAccessoryManager home](v16, "home");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v41 = v16;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "findOrAddUserIndexForUserUUID:guestName:accessory:flow:", v42, 0, v11, v14);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke;
    v53[3] = &unk_1E89BAC08;
    v54 = v11;
    v55 = v14;
    v26 = v26;
    v59 = a5;
    v56 = v26;
    v57 = v41;
    v58 = v25;
    objc_msgSend(v43, "flatMap:", v53);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v29;
}

- (id)writeRequestsWithAccessories:(id)a3 home:(id)a4 deviceCredentialKey:(id)a5 user:(id)a6 flow:(id)a7
{
  __CFString *v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDHomeWalletKeyAccessoryManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  HMDHomeWalletKeyAccessoryManager *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HMDHomeWalletKeyAccessoryManager *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  HMDHomeWalletKeyAccessoryManager *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  HMDHomeWalletKeyAccessoryManager *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  __CFString *v74;
  void *v75;
  void *v76;
  id v77;
  HMDHomeWalletKeyAccessoryManager *v78;
  id obj;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  uint8_t buf[4];
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  v73 = a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = a6;
  v77 = a7;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  v72 = v14;
  objc_msgSend(v14, "nfcIssuerKeyIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D16558]);
    objc_msgSend(v17, "setKey:", v13);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16568]), "initWithValue:", 2);
    objc_msgSend(v17, "setType:", v18);

    v71 = (void *)v16;
    objc_msgSend(v17, "setIssuerKeyIdentifier:", v16);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16560]), "initWithValue:", 1);
    objc_msgSend(v17, "setState:", v19);

    v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16570]), "initWithValue:", 2);
    v70 = v17;
    v85 = 0;
    v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16550]), "initWithOperationType:issuerKeyRequest:issuerKeyResponse:deviceCredentialKeyRequest:deviceCredentialKeyResponse:readerKeyRequest:readerKeyResponse:", v69, 0, 0, v17, 0, 0, 0);
    objc_msgSend(v68, "serializeWithError:", &v85);
    v20 = objc_claimAutoreleasedReturnValue();
    v67 = (const __CFString *)v85;
    v76 = (void *)v20;
    if (v20)
    {
      v66 = v13;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      obj = v73;
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
      if (v21)
      {
        v22 = v21;
        v80 = *(_QWORD *)v82;
        v78 = self;
        v74 = v12;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v82 != v80)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
            objc_msgSend(v24, "home");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "uuid");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString uuid](v12, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqual:", v27);

            if ((v28 & 1) != 0)
            {
              objc_msgSend(v24, "findServiceWithServiceType:", CFSTR("00000266-0000-1000-8000-0026BB765291"));
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v30 = v29;
              if (v29)
              {
                -[__CFString findCharacteristicWithType:](v29, "findCharacteristicWithType:", CFSTR("00000264-0000-1000-8000-0026BB765291"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                if (v31)
                {
                  +[HMDCharacteristicWriteRequest writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:](HMDCharacteristicWriteRequest, "writeRequestWithCharacteristic:value:authorizationData:identifier:type:includeResponseValue:", v31, v76, 0, 0, 0, 1);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "addObject:", v32);

                }
                else
                {
                  v46 = (void *)MEMORY[0x1D17BA0A0]();
                  v47 = self;
                  HMFGetOSLogHandle();
                  v48 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "UUID");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "shortDescription");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v87 = v49;
                    v88 = 2112;
                    v89 = v50;
                    v90 = 2112;
                    v91 = v51;
                    v92 = 2112;
                    v93 = v30;
                    v94 = 2112;
                    v95 = CFSTR("00000264-0000-1000-8000-0026BB765291");
                    _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, NFC access service: %@ doesn't support control point characteristic: %@", buf, 0x34u);

                    v12 = v74;
                  }

                  objc_autoreleasePoolPop(v46);
                  self = v78;
                }

              }
              else
              {
                v40 = (void *)MEMORY[0x1D17BA0A0]();
                v41 = self;
                HMFGetOSLogHandle();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "UUID");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "shortDescription");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v87 = v43;
                  v88 = 2112;
                  v89 = v44;
                  v90 = 2112;
                  v91 = v45;
                  v92 = 2112;
                  v93 = CFSTR("00000266-0000-1000-8000-0026BB765291");
                  _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, nfc access service not supported %@", buf, 0x2Au);

                  self = v78;
                }

                objc_autoreleasePoolPop(v40);
              }

            }
            else
            {
              v33 = (void *)MEMORY[0x1D17BA0A0]();
              v34 = self;
              HMFGetOSLogHandle();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "UUID");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "shortDescription");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "home");
                v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v87 = v36;
                v88 = 2112;
                v89 = v37;
                v90 = 2112;
                v91 = v38;
                v92 = 2112;
                v93 = v39;
                v94 = 2112;
                v95 = v12;
                _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, home: %@ doesn't match current home: %@", buf, 0x34u);

                self = v78;
              }

              objc_autoreleasePoolPop(v33);
            }
          }
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
        }
        while (v22);
      }

      v52 = (void *)objc_msgSend(v75, "copy");
      v13 = v66;
      v53 = (__CFString *)v67;
    }
    else
    {
      v60 = (void *)MEMORY[0x1D17BA0A0]();
      v61 = self;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      v53 = (__CFString *)v67;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "UUID");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v87 = v63;
        v88 = 2112;
        v89 = v64;
        v90 = 2112;
        v91 = 0;
        v92 = 2112;
        v93 = v67;
        _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, unable to encode nfc access control %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v60);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v54 = v71;
  }
  else
  {
    v54 = 0;
    v55 = (void *)MEMORY[0x1D17BA0A0]();
    v56 = self;
    HMFGetOSLogHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "UUID");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v87 = v58;
      v88 = 2112;
      v89 = v59;
      _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] NFC issuer key identifier for user is nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v55);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v52;
}

- (id)walletKeyColorWithCharacteristicValue:(id)a3 flow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  HMDHomeWalletKeyAccessoryManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeWalletKeyAccessoryManager *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v31;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D16508], "parsedFromData:error:", v6, &v33);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v33;
  if (v8)
  {
    objc_msgSend(v8, "RGBColorValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v11, "integerValue");
      if (v12 > 14935010)
      {
        v13 = v12 == 15521450;
        v14 = 14935011;
      }
      else
      {
        v13 = v12 == 0;
        v14 = 14341582;
      }
      if (v13 || v12 == v14)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "integerValue"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v11, "integerValue");
        *(_DWORD *)buf = 138543874;
        v35 = v24;
        v36 = 2112;
        v37 = v25;
        v38 = 2048;
        v39 = v31;
        v26 = "%{public}@[Flow: %@] Unable to get wallet key color, unsupported color value: %ld";
        v27 = v23;
        v28 = 32;
        goto LABEL_19;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v35 = v24;
        v36 = 2112;
        v37 = v25;
        v26 = "%{public}@[Flow: %@] Unable to get wallet key color, color value is set to nil for hardware finish";
        v27 = v23;
        v28 = 22;
LABEL_19:
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);

      }
    }

    objc_autoreleasePoolPop(v21);
    v20 = 0;
    goto LABEL_21;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v35 = v18;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = (uint64_t)v6;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to get wallet key color, failed to parse hardware finish from encoded tlv data %@:%@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v15);
  v20 = 0;
LABEL_22:

  return v20;
}

- (void)fetchWalletKeyColorForAccessories:(id)a3 flow:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomeWalletKeyAccessoryManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HMDHomeWalletKeyAccessoryManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  void (**v40)(id, void *, _QWORD);
  _QWORD v41[2];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDHomeWalletKeyAccessoryManager dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeWalletKeyAccessoryManager walletKeyColorPreferenceKey](self, "walletKeyColorPreferenceKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberValueFromNoBackupStoreWithKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v18;
      v44 = 2112;
      v45 = v19;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Skipping fetch, returning wallet key color from persistence store", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v10[2](v10, v14, 0);
  }
  else
  {
    -[HMDHomeWalletKeyAccessoryManager home](self, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v8, "na_filter:", &__block_literal_global_281);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "na_filter:", &__block_literal_global_282);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorForAccessories_Matter:home:flow:](self, "fetchWalletKeyColorForAccessories_Matter:home:flow:", v21, v20, v9);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeWalletKeyAccessoryManager fetchWalletKeyColorForAccessories_HAP:home:flow:](self, "fetchWalletKeyColorForAccessories_HAP:home:flow:", v36, v20, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v8;
      v23 = (void *)MEMORY[0x1E0D519C0];
      v41[0] = v35;
      v41[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D519E8];
      -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
      v37 = v20;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "schedulerWithDispatchQueue:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "combineAllFutures:ignoringErrors:scheduler:", v24, 1, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_3;
      v39[3] = &unk_1E89BACD8;
      v39[4] = self;
      v40 = v10;
      v29 = (id)objc_msgSend(v28, "addSuccessBlock:", v39);

      v8 = v38;
      v20 = v37;

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v33;
        v44 = 2112;
        v45 = v34;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options, home is nil", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v10)[2](v10, 0, v21);
    }

  }
}

- (id)fetchWalletKeyColorForAccessories_Matter:(id)a3 home:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    v31 = 2112;
    v32 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for Matter accessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke;
  v25[3] = &unk_1E89BAD28;
  v17 = v10;
  v26 = v17;
  objc_msgSend(v8, "na_map:", v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "combineAllFutures");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_3;
  v23[3] = &unk_1E89BADB0;
  v23[4] = v12;
  v24 = v17;
  v20 = v17;
  objc_msgSend(v19, "flatMap:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)fetchWalletKeyColorForAccessories_HAP:(id)a3 home:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDHomeWalletKeyAccessoryManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Fetching wallet key color for HAP accessories: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v16 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke;
  v33[3] = &unk_1E89BADD8;
  v33[4] = v12;
  v17 = v10;
  v34 = v17;
  objc_msgSend(v8, "na_map:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");
  v20 = (void *)MEMORY[0x1E0D519C0];
  if (v19)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_initWeak((id *)buf, v12);
    -[HMFObject description](v12, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_290;
    v28[3] = &unk_1E89BAE00;
    objc_copyWeak(&v32, (id *)buf);
    v23 = v21;
    v29 = v23;
    v30 = v18;
    v31 = v17;
    objc_msgSend(v9, "readCharacteristicValues:source:sourceForLogging:qualityOfService:withCompletionHandler:", v30, 7, v22, -1, v28);

    v24 = v31;
    v25 = v23;

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "futureWithError:", v26);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

- (void)startHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4 expectedCount:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeKeySetupLockLogEvent *v15;
  void *v16;
  HMDHomeKeySetupLockLogEvent *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  unint64_t v21;

  v8 = a3;
  -[HMDHomeWalletKeyAccessoryManager logEvents](self, "logEvents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_filter:", &__block_literal_global_292);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[HMDHomeWalletKeyAccessoryManager setLogEvents:](self, "setLogEvents:", v11);

  -[HMDHomeWalletKeyAccessoryManager logEvents](self, "logEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke_2;
  v19[3] = &unk_1E89BAE68;
  v18 = v8;
  v20 = v18;
  v21 = a4;
  objc_msgSend(v12, "na_firstObjectPassingTest:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[HMDHomeWalletKeyAccessoryManager logEvents](self, "logEvents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [HMDHomeKeySetupLockLogEvent alloc];
    -[HMDHomeWalletKeyAccessoryManager workQueue](self, "workQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDHomeKeySetupLockLogEvent initWithAccessoryUUID:withKeyType:expectedCount:queue:](v15, "initWithAccessoryUUID:withKeyType:expectedCount:queue:", v18, a4, a5, v16);
    objc_msgSend(v14, "addObject:", v17);

  }
}

- (void)updateHomeWalletKeyAddForAccessoryUUID:(id)a3 keyType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a3;
  -[HMDHomeWalletKeyAccessoryManager logEvents](self, "logEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__HMDHomeWalletKeyAccessoryManager_updateHomeWalletKeyAddForAccessoryUUID_keyType___block_invoke;
  v11[3] = &unk_1E89BAE68;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "incrementCompleted"))
  {
    -[HMDHomeWalletKeyAccessoryManager logEvents](self, "logEvents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", v8);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessageDispatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setCurrentDevicePrimaryResident:(BOOL)a3
{
  self->_currentDevicePrimaryResident = a3;
}

- (NSMutableDictionary)pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation)pendingPrimaryResidentDeviceCredentialKeyOperation
{
  return (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPendingPrimaryResidentDeviceCredentialKeyOperation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSMutableDictionary)nfcReaderKeyConfigureStateByAccessoryUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)walletKeyColor
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableSet)logEvents
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLogEvents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEvents, 0);
  objc_storeStrong((id *)&self->_walletKeyColor, 0);
  objc_storeStrong((id *)&self->_nfcReaderKeyConfigureStateByAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_pendingPrimaryResidentDeviceCredentialKeyOperation, 0);
  objc_storeStrong((id *)&self->_pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_destroyWeak((id *)&self->_delegate);
}

BOOL __83__HMDHomeWalletKeyAccessoryManager_updateHomeWalletKeyAddForAccessoryUUID_keyType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "keyType") == *(_QWORD *)(a1 + 40);
  else
    v5 = 0;

  return v5;
}

BOOL __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "keyType") == *(_QWORD *)(a1 + 40);
  else
    v5 = 0;

  return v5;
}

uint64_t __96__HMDHomeWalletKeyAccessoryManager_startHomeWalletKeyAddForAccessoryUUID_keyType_expectedCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSubmitted") ^ 1;
}

id __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)*MEMORY[0x1E0CB99A0];
  objc_msgSend(v3, "findServiceWithServiceType:", *MEMORY[0x1E0CB99A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "findCharacteristicWithType:", CFSTR("0000026C-0000-1000-8000-0026BB765291"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[HMDCharacteristicRequest requestWithCharacteristic:](HMDCharacteristicRequest, "requestWithCharacteristic:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138544386;
        v23 = v18;
        v24 = 2112;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = CFSTR("0000026C-0000-1000-8000-0026BB765291");
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options: %@, accessory information service: %@ doesn't support hardware finish characteristic: %@", (uint8_t *)&v22, 0x34u);

      }
      objc_autoreleasePoolPop(v15);
      v8 = 0;
    }

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
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v4;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color options: %@, accessory information service not supported %@", (uint8_t *)&v22, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    v8 = 0;
  }

  return v8;
}

void __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_290(id *a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_2;
    block[3] = &unk_1E89C1710;
    v11 = a1[5];
    v12 = v4;
    v13 = v6;
    v14 = a1[6];
    v15 = a1[4];
    dispatch_async(v7, block);

  }
  else
  {
    v8 = a1[4];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithError:", v9);

  }
}

void __84__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_HAP_home_flow___block_invoke_2(id *a1)
{
  id *v1;
  __int128 v2;
  uint64_t i;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  void *v32;
  id obj;
  id *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v1 = a1;
  v53 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = a1[4];
  v34 = v1;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v39;
    *(_QWORD *)&v2 = 138544386;
    v31 = v2;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v4, "characteristic", v31);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v1[5];
        v37 = 0;
        objc_msgSend(v6, "hmd_valueOfCharacteristic:error:", v5, &v37);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v37;
        if (v7)
        {
          v9 = v7;
          objc_opt_class();
          v10 = objc_opt_isKindOfClass() & 1;
          if (v10)
            v11 = v9;
          else
            v11 = 0;
          v12 = v11;

          if (v10)
          {
            v1 = v34;
            objc_msgSend(v34[6], "walletKeyColorWithCharacteristicValue:flow:", v9, v34[7]);
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v30 = (void *)v13;

              objc_msgSend(v34[8], "finishWithResult:", v30);
              goto LABEL_25;
            }
          }
          else
          {
            v19 = (void *)MEMORY[0x1D17BA0A0]();
            v1 = v34;
            v20 = v34[6];
            HMFGetOSLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v32 = v19;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34[7], "UUID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_opt_class();
              *(_DWORD *)buf = v31;
              v43 = v22;
              v44 = 2112;
              v45 = v23;
              v46 = 2112;
              v47 = v4;
              v48 = 2112;
              v49 = v9;
              v50 = 2112;
              v51 = v24;
              _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Characteristic value in the read request: %@ is not of type %@:%@", buf, 0x34u);

              v1 = v34;
              v19 = v32;
            }

            objc_autoreleasePoolPop(v19);
          }

        }
        else
        {
          v14 = (void *)MEMORY[0x1D17BA0A0]();
          v15 = v1[6];
          HMFGetOSLogHandle();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1[7], "UUID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v43 = v17;
            v44 = 2112;
            v45 = v18;
            v46 = 2112;
            v47 = v4;
            v48 = 2112;
            v49 = v8;
            _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Characteristic read request failed with error %@:%@", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v14);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v36);
  }

  v25 = (void *)MEMORY[0x1D17BA0A0]();
  v26 = v1[6];
  HMFGetOSLogHandle();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v28;
    _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Failed to find wallet key color for HAP accessories", buf, 0xCu);

    v1 = v34;
  }

  objc_autoreleasePoolPop(v25);
  v29 = v1[8];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "finishWithError:", v30);
LABEL_25:

}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "waitForDoorLockClusterObjectWithFlow:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_2;
  v7[3] = &unk_1E89BAD00;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "then:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "naFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
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
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "na_map:", &__block_literal_global_285);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_287);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to find wallet key color for Matter accessories", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v12 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "futureWithResult:", v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

BOOL __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "integerValue") >= 0;
}

id __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

void __87__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_Matter_home_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "fetchAccessoryColor_flow:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

  }
  else
  {
    v6 = _HMFPreconditionFailure();
    __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_3(v6, v7);
  }
}

void __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_3(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "na_map:", &__block_literal_global_284);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "walletKeyColorPreferenceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistNumberValueToNoBackupStore:withKey:", v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"));

    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "integerValue");
      HMHomeWalletKeyColorAsString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched wallet key color: %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Failed to find color for Matter or HAP accessories", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v19);

  }
}

id __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsHAP");
}

uint64_t __90__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorForAccessories_flow_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP");
}

void __74__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithAccessory_flow___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138544130;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch wallet key color when accessory connected %@:%@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }

}

id __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "waitForDoorLockClusterObjectWithFlow:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_2;
  v20[3] = &unk_1E89BABB8;
  v6 = *(id *)(a1 + 48);
  v24 = *(_QWORD *)(a1 + 72);
  v21 = v6;
  v22 = v3;
  v23 = *(id *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v4, "then:", v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  v13 = 3221225472;
  v14 = __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3;
  v15 = &unk_1E89BABE0;
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 64);
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v8, "then:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "naFuture", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "addDeviceCredentialKeyData:ofType:forUserIndex:flow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "integerValue"), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3(v7);
  }
}

uint64_t __105__HMDHomeWalletKeyAccessoryManager_configureMatterAccessory_withDeviceCredentialKey_ofType_forUser_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "status"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B34AA0),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v11;
      v29 = 2112;
      v30 = v12;
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with device credential key %@, accessory: %@", (uint8_t *)&v27, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    v15 = 1;
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "status");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544130;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = v21;
      v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", (uint8_t *)&v27, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
    }

    v15 = 2;
  }

  return v15;
}

id __73__HMDHomeWalletKeyAccessoryManager_performHAPWriteRequestsHH2_home_flow___block_invoke(id *a1, void *a2)
{
  id WeakRetained;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id *v70;
  id obj;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  id v96;
  __int16 v97;
  id v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v81 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    v54 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "UUID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v90 = v56;
      v91 = 2112;
      v92 = v57;
      _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key object got invalidated", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v54);
    v58 = (void *)MEMORY[0x1E0D519C0];
    v59 = (void *)MEMORY[0x1E0CB35C8];
    v60 = 23;
    goto LABEL_46;
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v70 = a1;
  obj = a1[5];
  v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  if (v80)
  {
    v65 = 0;
    v79 = *(_QWORD *)v86;
    v69 = WeakRetained;
    do
    {
      for (i = 0; i != v80; ++i)
      {
        if (*(_QWORD *)v86 != v79)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "characteristic");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        objc_msgSend(v81, "hmd_valueOfCharacteristic:error:", v5, &v84);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v84;
        if (v7)
        {
          v9 = v7;
          objc_opt_class();
          v10 = objc_opt_isKindOfClass() & 1;
          if (v10)
            v11 = v9;
          else
            v11 = 0;
          v12 = v11;

          v82 = v12;
          if (v10)
          {
            v83 = 0;
            objc_msgSend(MEMORY[0x1E0D16550], "parsedFromData:error:", v9, &v83);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v83;
            v74 = v6;
            if (v13)
            {
              objc_msgSend(v13, "deviceCredentialKeyResponse");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "statusCode");
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15 && (!objc_msgSend(v15, "value") || objc_msgSend(v15, "value") == 2))
              {
                v16 = (void *)MEMORY[0x1D17BA0A0]();
                v17 = WeakRetained;
                HMFGetOSLogHandle();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70[4], "UUID");
                  v75 = v7;
                  v66 = v8;
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "shortDescription");
                  v21 = v16;
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v90 = v19;
                  v91 = 2112;
                  v92 = v20;
                  v93 = 2112;
                  v94 = v22;
                  v95 = 2112;
                  v96 = v15;
                  _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured with device credential key: %@ with status code: %@", buf, 0x2Au);

                  v16 = v21;
                  v8 = v66;
                  v7 = v75;

                  WeakRetained = v69;
                }

                objc_autoreleasePoolPop(v16);
                ++v65;
              }
              else
              {
                v47 = (void *)MEMORY[0x1D17BA0A0]();
                v48 = WeakRetained;
                HMFGetOSLogHandle();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70[4], "UUID");
                  v78 = v7;
                  v68 = v8;
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "shortDescription");
                  v52 = v47;
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v90 = v50;
                  v91 = 2112;
                  v92 = v51;
                  v93 = 2112;
                  v94 = v53;
                  v95 = 2112;
                  v96 = v15;
                  _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", buf, 0x2Au);

                  v47 = v52;
                  v8 = v68;
                  v7 = v78;

                  WeakRetained = v69;
                }

                objc_autoreleasePoolPop(v47);
              }

            }
            else
            {
              v40 = (void *)MEMORY[0x1D17BA0A0]();
              v41 = WeakRetained;
              HMFGetOSLogHandle();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70[4], "UUID");
                v77 = v7;
                v67 = v8;
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "shortDescription");
                v45 = v40;
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544386;
                v90 = v43;
                v91 = 2112;
                v92 = v44;
                v93 = 2112;
                v94 = v46;
                v95 = 2112;
                v96 = v9;
                v97 = 2112;
                v98 = v72;
                _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@, failed to parse response value %@:%@", buf, 0x34u);

                v40 = v45;
                v8 = v67;
                v7 = v77;

                WeakRetained = v69;
              }

              objc_autoreleasePoolPop(v40);
            }
            v6 = v74;
            v39 = v82;

          }
          else
          {
            v31 = (void *)MEMORY[0x1D17BA0A0]();
            v32 = WeakRetained;
            HMFGetOSLogHandle();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v73 = v31;
              v34 = v6;
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70[4], "UUID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "shortDescription");
              v76 = v7;
              v37 = v8;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v90 = v35;
              v91 = 2112;
              v92 = v36;
              v93 = 2112;
              v94 = v38;
              v95 = 2112;
              v96 = v9;
              _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

              v8 = v37;
              v7 = v76;

              WeakRetained = v69;
              v6 = v34;
              v31 = v73;
            }

            objc_autoreleasePoolPop(v31);
            v39 = v82;
          }

        }
        else
        {
          v23 = (void *)MEMORY[0x1D17BA0A0]();
          v24 = WeakRetained;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70[4], "UUID");
            v27 = v8;
            v28 = v6;
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "shortDescription");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v90 = v26;
            v91 = 2112;
            v92 = v29;
            v93 = 2112;
            v94 = v30;
            v95 = 2112;
            v96 = v81;
            v97 = 2112;
            v98 = v5;
            _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

            WeakRetained = v69;
            v6 = v28;
            v8 = v27;
            v7 = 0;

          }
          objc_autoreleasePoolPop(v23);
        }

      }
      v80 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
    }
    while (v80);
  }
  else
  {
    v65 = 0;
  }

  if (v65 != objc_msgSend(v70[5], "count"))
  {
    v58 = (void *)MEMORY[0x1E0D519C0];
    v59 = (void *)MEMORY[0x1E0CB35C8];
    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2008);
      v62 = objc_claimAutoreleasedReturnValue();
LABEL_47:
      v63 = (void *)v62;
      objc_msgSend(v58, "futureWithError:", v62);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_48;
    }
    v60 = 52;
LABEL_46:
    objc_msgSend(v59, "hmErrorWithCode:", v60);
    v62 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v61;
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_271(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureMatterAccessory:withDeviceCredentialKey:ofType:forUser:flow:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

id __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_273(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty");
  v2 = (void *)MEMORY[0x1E0D519C0];
  if (v1)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
  else
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2008);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithError:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2_275(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP");
}

uint64_t __131__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH2_withDeviceCredentialKey_ofType_forDeviceWithUUID_user_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP") ^ 1;
}

void __124__HMDHomeWalletKeyAccessoryManager_configureAccessories_HH1_withDeviceCredentialKey_forDeviceWithUUID_user_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  id obj;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  id v117;
  __int16 v118;
  id v119;
  __int16 v120;
  id v121;
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v104 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v9 = (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)objc_claimAutoreleasedReturnValue();

    -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation deviceCredentialKey](v9, "deviceCredentialKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 48));

    if ((v11 & 1) != 0)
    {
      if (v104)
      {
        v85 = v9;
        v86 = v5;
        -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation accessoriesUUIDs](v9, "accessoriesUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (void *)objc_msgSend(v12, "mutableCopy");

        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v93 = a1;
        obj = *(id *)(a1 + 56);
        v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
        if (v103)
        {
          v91 = 0;
          v102 = *(_QWORD *)v109;
          v92 = v7;
          do
          {
            for (i = 0; i != v103; ++i)
            {
              if (*(_QWORD *)v109 != v102)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * i), "characteristic");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "accessory");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = 0;
              objc_msgSend(v104, "hmd_valueOfCharacteristic:error:", v14, &v107);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v107;
              if (v16)
              {
                v18 = v16;
                objc_opt_class();
                v19 = objc_opt_isKindOfClass() & 1;
                if (v19)
                  v20 = v18;
                else
                  v20 = 0;
                v21 = v20;

                v105 = v21;
                if (v19)
                {
                  v106 = 0;
                  objc_msgSend(MEMORY[0x1E0D16550], "parsedFromData:error:", v18, &v106);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = v106;
                  v101 = v15;
                  if (v22)
                  {
                    objc_msgSend(v22, "deviceCredentialKeyResponse");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "statusCode");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24 && (!objc_msgSend(v24, "value") || objc_msgSend(v24, "value") == 2))
                    {
                      v25 = (void *)MEMORY[0x1D17BA0A0]();
                      v26 = v7;
                      HMFGetOSLogHandle();
                      v27 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v97 = v16;
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*(id *)(v93 + 32), "UUID");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v101, "shortDescription");
                        v88 = v25;
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v113 = v28;
                        v114 = 2112;
                        v115 = v29;
                        v116 = 2112;
                        v117 = v30;
                        v118 = 2112;
                        v119 = v24;
                        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured with device credential key: %@ with status code: %@", buf, 0x2Au);

                        v25 = v88;
                        v7 = v92;

                        v16 = v97;
                      }

                      objc_autoreleasePoolPop(v25);
                      ++v91;
                      v15 = v101;
                      objc_msgSend(v101, "uuid");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "removeObject:", v31);

                    }
                    else
                    {
                      v55 = (void *)MEMORY[0x1D17BA0A0]();
                      v56 = v7;
                      HMFGetOSLogHandle();
                      v57 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      {
                        HMFGetLogIdentifier();
                        v100 = v16;
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(*(id *)(v93 + 32), "UUID");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v101, "shortDescription");
                        v90 = v55;
                        v60 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138544130;
                        v113 = v58;
                        v114 = 2112;
                        v115 = v59;
                        v116 = 2112;
                        v117 = v60;
                        v118 = 2112;
                        v119 = v24;
                        _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@ with status code: %@", buf, 0x2Au);

                        v55 = v90;
                        v7 = v92;

                        v16 = v100;
                      }

                      objc_autoreleasePoolPop(v55);
                      v15 = v101;
                    }

                  }
                  else
                  {
                    v49 = (void *)MEMORY[0x1D17BA0A0]();
                    v50 = v7;
                    HMFGetOSLogHandle();
                    v51 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v99 = v16;
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(*(id *)(v93 + 32), "UUID");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v101, "shortDescription");
                      v89 = v49;
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544386;
                      v113 = v52;
                      v114 = 2112;
                      v115 = v53;
                      v116 = 2112;
                      v117 = v54;
                      v118 = 2112;
                      v119 = v18;
                      v120 = 2112;
                      v121 = v95;
                      _os_log_impl(&dword_1CD062000, v51, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with device credential key: %@, failed to parse response value %@:%@", buf, 0x34u);

                      v49 = v89;
                      v7 = v92;

                      v16 = v99;
                    }

                    objc_autoreleasePoolPop(v49);
                    v15 = v101;
                  }
                  v48 = v105;

                }
                else
                {
                  v40 = (void *)MEMORY[0x1D17BA0A0]();
                  v41 = v7;
                  HMFGetOSLogHandle();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v98 = v17;
                    v43 = v15;
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v93 + 32), "UUID");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "shortDescription");
                    v96 = v40;
                    v46 = v16;
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v113 = v44;
                    v114 = 2112;
                    v115 = v45;
                    v116 = 2112;
                    v117 = v47;
                    v118 = 2112;
                    v119 = v18;
                    _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

                    v16 = v46;
                    v40 = v96;

                    v7 = v92;
                    v15 = v43;
                    v17 = v98;
                  }

                  objc_autoreleasePoolPop(v40);
                  v48 = v105;
                }

              }
              else
              {
                v32 = (void *)MEMORY[0x1D17BA0A0]();
                v33 = v7;
                HMFGetOSLogHandle();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(v93 + 32), "UUID");
                  v36 = v17;
                  v37 = v15;
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "shortDescription");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544386;
                  v113 = v35;
                  v114 = 2112;
                  v115 = v38;
                  v116 = 2112;
                  v117 = v39;
                  v118 = 2112;
                  v119 = v104;
                  v120 = 2112;
                  v121 = v14;
                  _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

                  v7 = v92;
                  v15 = v37;
                  v17 = v36;
                  v16 = 0;

                }
                objc_autoreleasePoolPop(v32);
              }

            }
            v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
          }
          while (v103);
        }
        else
        {
          v91 = 0;
        }

        v80 = v87;
        if (objc_msgSend(v87, "count"))
        {
          v81 = v93;
          v9 = -[HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation initWithDeviceCredentialKey:accessoriesUUIDs:user:]([HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation alloc], "initWithDeviceCredentialKey:accessoriesUUIDs:user:", *(_QWORD *)(v93 + 48), v87, *(_QWORD *)(v93 + 64));
          v5 = v86;
        }
        else
        {
          v9 = 0;
          v5 = v86;
          v81 = v93;
        }

        objc_msgSend(v7, "pendingAccessoryDeviceCredentialKeyOperationByDeviceUUID");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setObject:forKeyedSubscript:", v9, *(_QWORD *)(v81 + 40));

        if (v91 == objc_msgSend(*(id *)(v81 + 56), "count"))
        {
          (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v81 + 80) + 16))(*(_QWORD *)(v81 + 80), *(_QWORD *)(v81 + 72));
        }
        else
        {
          v83 = *(_QWORD *)(v81 + 80);
          if (v91)
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmPrivateErrorWithCode:", 2008);
          else
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v83 + 16))(v83, v84);

        }
        goto LABEL_49;
      }
      v75 = (void *)MEMORY[0x1D17BA0A0]();
      v76 = v7;
      HMFGetOSLogHandle();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "UUID");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v113 = v78;
        v114 = 2112;
        v115 = v79;
        v116 = 2112;
        v117 = v5;
        _os_log_impl(&dword_1CD062000, v77, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key, write response is nil: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v75);
      v72 = *(_QWORD *)(a1 + 80);
      v73 = (void *)MEMORY[0x1E0CB35C8];
      v74 = -1;
    }
    else
    {
      v66 = (void *)MEMORY[0x1D17BA0A0]();
      v67 = v7;
      HMFGetOSLogHandle();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "UUID");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v113 = v69;
        v114 = 2112;
        v115 = v70;
        v116 = 2112;
        v117 = v71;
        _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Operation cancelled because device credential key was updated for deviceUUID: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v66);
      v72 = *(_QWORD *)(a1 + 80);
      v73 = (void *)MEMORY[0x1E0CB35C8];
      v74 = 23;
    }
    objc_msgSend(v73, "hmErrorWithCode:", v74);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v72 + 16))(v72, v80);
LABEL_49:

    goto LABEL_50;
  }
  v61 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v113 = v63;
    v114 = 2112;
    v115 = v64;
    _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with device credential key object got invalidated", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v61);
  v65 = *(_QWORD *)(a1 + 80);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
  v9 = (HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, HMDHomeWalletKeyAccessoryManagerDeviceCredentialKeyOperation *))(v65 + 16))(v65, v9);
LABEL_50:

}

uint64_t __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessoriesUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

void __99__HMDHomeWalletKeyAccessoryManager_handlePendingDeviceCredentialKeysSyncForAccessories_withReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Device credential key pending operation failed %@:%@ ";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Device credential key pending operation succesed %@ ";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "addOrUpdateReaderKeyData:flow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2(v7);
  }
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "status");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "status"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_1E8B34AA0),
        v6,
        v5,
        v7))
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 56), "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v11;
      v28 = 2112;
      v29 = v12;
      v30 = 2112;
      v31 = v13;
      v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with NFC reader key: %@, accessory: %@", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v15 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 56), "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateHomeWalletKeyAddForAccessoryUUID:keyType:", v16, 0);
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "status");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138544130;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v23;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@ with status code: %@", (uint8_t *)&v26, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
    v24 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v16);
  }

  return 1;
}

uint64_t __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x1E0D33258])
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 8)
  {
LABEL_7:
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Failed to configure NFC reader key with error: %@", (uint8_t *)&v15, 0x20u);

    }
    goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Ignoring duplicate error while adding Reader key", (uint8_t *)&v15, 0x16u);

  }
LABEL_9:

  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  return 1;
}

void __97__HMDHomeWalletKeyAccessoryManager_configureAccessoryWithNfcReaderKey_accessory_flow_completion___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v83 = 0;
      objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v83);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v83;
      v81 = v11;
      if (!v11)
      {
        v45 = (void *)MEMORY[0x1D17BA0A0]();
        v46 = WeakRetained;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v76 = v6;
          v78 = v5;
          v48 = v9;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v51 = v45;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          v85 = v49;
          v86 = 2112;
          v87 = v50;
          v88 = 2112;
          v89 = v52;
          v90 = 2112;
          v91 = v78;
          v92 = 2112;
          v93 = v53;
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          v45 = v51;
          v9 = v48;
          v6 = v76;
          v5 = v78;
        }

        objc_autoreleasePoolPop(v45);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_32;
      }
      v75 = v6;
      v13 = v11;
      objc_opt_class();
      v14 = objc_opt_isKindOfClass() & 1;
      if (v14)
        v15 = v13;
      else
        v15 = 0;
      v16 = v15;

      if (!v14)
      {
        v79 = v16;
        v54 = (void *)MEMORY[0x1D17BA0A0]();
        v55 = WeakRetained;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = v55;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v74 = v54;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v85 = v57;
          v86 = 2112;
          v87 = v58;
          v88 = 2112;
          v89 = v13;
          v90 = 2112;
          v91 = v59;
          _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, response value: %@ is not of type NSData", buf, 0x2Au);

          v54 = v74;
          v55 = v72;
        }

        objc_autoreleasePoolPop(v54);
        v60 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v19);
        v6 = v75;
        v16 = v79;
        goto LABEL_31;
      }
      v82 = 0;
      objc_msgSend(MEMORY[0x1E0D16550], "parsedFromData:error:", v13, &v82);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v82;
      v19 = v18;
      v73 = v17;
      if (v17)
      {
        objc_msgSend(v17, "readerKeyResponse");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "statusCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && !objc_msgSend(v21, "value"))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_30;
        }
        v71 = v19;
        v77 = v16;
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = WeakRetained;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v69 = v22;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v85 = v25;
          v86 = 2112;
          v87 = v26;
          v88 = 2112;
          v89 = v27;
          v90 = 2112;
          v91 = v21;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@ with status code: %@", buf, 0x2Au);

          v22 = v69;
          v23 = v67;
        }

        objc_autoreleasePoolPop(v22);
        v28 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        v16 = v77;
      }
      else
      {
        v71 = v18;
        v61 = (void *)MEMORY[0x1D17BA0A0]();
        v70 = WeakRetained;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = v61;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v80 = v16;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v85 = v63;
          v86 = 2112;
          v87 = v64;
          v88 = 2112;
          v89 = v65;
          v90 = 2112;
          v91 = v13;
          v92 = 2112;
          v93 = v71;
          _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, failed to parse response value %@:%@", buf, 0x34u);

          v16 = v80;
          v61 = v68;
        }

        objc_autoreleasePoolPop(v61);
        v66 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v21);
      }
      v19 = v71;
LABEL_30:

      v6 = v75;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    v36 = v8;
    v37 = v6;
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = WeakRetained;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v41;
      v86 = 2112;
      v87 = v42;
      v88 = 2112;
      v89 = v43;
      v90 = 2112;
      v91 = v37;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, write response is nil: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v38);
    v44 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v44 + 16))(v44, v12);
    v6 = v37;
    v9 = v36;
    v5 = 0;
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v32;
      v86 = 2112;
      v87 = v33;
      v88 = 2112;
      v89 = v34;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure with reader key: %@, object got invalidated", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v35 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v35 + 16))(v35, v12);
  }
LABEL_33:

}

void __95__HMDHomeWalletKeyAccessoryManager_removeNfcReaderKeyWithIdentifier_accessory_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = objc_loadWeakRetained((id *)(a1 + 64));
  v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v83 = 0;
      objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v83);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v83;
      v81 = v11;
      if (!v11)
      {
        v45 = (void *)MEMORY[0x1D17BA0A0]();
        v46 = WeakRetained;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v76 = v6;
          v78 = v5;
          v48 = v9;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v51 = v45;
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          v85 = v49;
          v86 = 2112;
          v87 = v50;
          v88 = 2112;
          v89 = v52;
          v90 = 2112;
          v91 = v78;
          v92 = 2112;
          v93 = v53;
          _os_log_impl(&dword_1CD062000, v47, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          v45 = v51;
          v9 = v48;
          v6 = v76;
          v5 = v78;
        }

        objc_autoreleasePoolPop(v45);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        goto LABEL_32;
      }
      v75 = v6;
      v13 = v11;
      objc_opt_class();
      v14 = objc_opt_isKindOfClass() & 1;
      if (v14)
        v15 = v13;
      else
        v15 = 0;
      v16 = v15;

      if (!v14)
      {
        v79 = v16;
        v54 = (void *)MEMORY[0x1D17BA0A0]();
        v55 = WeakRetained;
        HMFGetOSLogHandle();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v72 = v55;
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v74 = v54;
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v85 = v57;
          v86 = 2112;
          v87 = v58;
          v88 = 2112;
          v89 = v13;
          v90 = 2112;
          v91 = v59;
          _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, response value: %@ is not of type NSData", buf, 0x2Au);

          v54 = v74;
          v55 = v72;
        }

        objc_autoreleasePoolPop(v54);
        v60 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v60 + 16))(v60, v19);
        v6 = v75;
        v16 = v79;
        goto LABEL_31;
      }
      v82 = 0;
      objc_msgSend(MEMORY[0x1E0D16550], "parsedFromData:error:", v13, &v82);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v82;
      v19 = v18;
      v73 = v17;
      if (v17)
      {
        objc_msgSend(v17, "readerKeyResponse");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "statusCode");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 && !objc_msgSend(v21, "value"))
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          goto LABEL_30;
        }
        v71 = v19;
        v77 = v16;
        v22 = (void *)MEMORY[0x1D17BA0A0]();
        v23 = WeakRetained;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = v23;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v69 = v22;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v85 = v25;
          v86 = 2112;
          v87 = v26;
          v88 = 2112;
          v89 = v27;
          v90 = 2112;
          v91 = v21;
          _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@ with status code: %@", buf, 0x2Au);

          v22 = v69;
          v23 = v67;
        }

        objc_autoreleasePoolPop(v22);
        v28 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v29);

        v16 = v77;
      }
      else
      {
        v71 = v18;
        v61 = (void *)MEMORY[0x1D17BA0A0]();
        v70 = WeakRetained;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v68 = v61;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v80 = v16;
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v85 = v63;
          v86 = 2112;
          v87 = v64;
          v88 = 2112;
          v89 = v65;
          v90 = 2112;
          v91 = v13;
          v92 = 2112;
          v93 = v71;
          _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, failed to parse response value %@:%@", buf, 0x34u);

          v16 = v80;
          v61 = v68;
        }

        objc_autoreleasePoolPop(v61);
        v66 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v21);
      }
      v19 = v71;
LABEL_30:

      v6 = v75;
LABEL_31:

LABEL_32:
      goto LABEL_33;
    }
    v36 = v8;
    v37 = v6;
    v38 = (void *)MEMORY[0x1D17BA0A0]();
    v39 = WeakRetained;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v85 = v41;
      v86 = 2112;
      v87 = v42;
      v88 = 2112;
      v89 = v43;
      v90 = 2112;
      v91 = v37;
      _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, write response is nil: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v38);
    v44 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v44 + 16))(v44, v12);
    v6 = v37;
    v9 = v36;
    v5 = 0;
  }
  else
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v85 = v32;
      v86 = 2112;
      v87 = v33;
      v88 = 2112;
      v89 = v34;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to remove reader key from: %@, object got invalidated", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v30);
    v35 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v35 + 16))(v35, v12);
  }
LABEL_33:

}

void __102__HMDHomeWalletKeyAccessoryManager_fetchIsAccessoryConfiguredWithReaderKey_accessory_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  id v78;
  __int16 v79;
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = objc_loadWeakRetained((id *)(a1 + 72));
  v9 = v8;
  if (WeakRetained)
  {
    if (v5)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v70 = 0;
      objc_msgSend(v5, "hmd_valueOfCharacteristic:error:", v10, &v70);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v70;
      if (v11)
      {
        v66 = v6;
        v13 = v11;
        objc_opt_class();
        v14 = objc_opt_isKindOfClass() & 1;
        if (v14)
          v15 = v13;
        else
          v15 = 0;
        v68 = v15;

        if (v14)
        {
          v69 = 0;
          objc_msgSend(MEMORY[0x1E0D16550], "parsedFromData:error:", v13, &v69);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v69;
          if (v16)
          {
            v62 = v11;
            objc_msgSend(v16, "readerKeyResponse");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 48), "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToData:", v20);

            if (v21)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
              v6 = v66;
            }
            else
            {
              v6 = v66;
              if (v19)
                v55 = v19;
              else
                v55 = 0;
              (*(void (**)(_QWORD, _QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0, v55, 0);
            }
            v11 = v62;
          }
          else
          {
            v51 = (void *)MEMORY[0x1D17BA0A0]();
            v61 = WeakRetained;
            HMFGetOSLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "UUID");
              v65 = v11;
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "shortDescription");
              v56 = v51;
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v72 = v57;
              v73 = 2112;
              v74 = v52;
              v75 = 2112;
              v76 = v53;
              v77 = 2112;
              v78 = v13;
              v79 = 2112;
              v80 = v17;
              _os_log_impl(&dword_1CD062000, v59, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, failed to parse response value %@:%@", buf, 0x34u);

              v51 = v56;
              v11 = v65;

            }
            objc_autoreleasePoolPop(v51);
            v54 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v54 + 16))(v54, 0, 0, v19);
            v6 = v66;
          }

        }
        else
        {
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = WeakRetained;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v58 = v45;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "UUID");
            v64 = v11;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "shortDescription");
            v60 = v44;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v72 = v47;
            v73 = 2112;
            v74 = v48;
            v75 = 2112;
            v76 = v49;
            v77 = 2112;
            v78 = v13;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, response value: %@ is not of type NSData", buf, 0x2Au);

            v44 = v60;
            v11 = v64;

            v45 = v58;
          }

          objc_autoreleasePoolPop(v44);
          v50 = *(_QWORD *)(a1 + 56);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v50 + 16))(v50, 0, 0, v17);
          v6 = v66;
        }

      }
      else
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = WeakRetained;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v67 = v6;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "UUID");
          v63 = v37;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "shortDescription");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138544386;
          v72 = v40;
          v73 = 2112;
          v74 = v41;
          v75 = 2112;
          v76 = v42;
          v77 = 2112;
          v78 = v5;
          v79 = 2112;
          v80 = v43;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, unable to parse write response dictionary: %@ with characteristic: %@", buf, 0x34u);

          v11 = 0;
          v37 = v63;

          v6 = v67;
        }

        objc_autoreleasePoolPop(v37);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }

    }
    else
    {
      v28 = v8;
      v29 = v6;
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = WeakRetained;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "UUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "shortDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v72 = v33;
        v73 = 2112;
        v74 = v34;
        v75 = 2112;
        v76 = v35;
        v77 = 2112;
        v78 = v29;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key: %@, write response is nil: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v30);
      v36 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v36 + 16))(v36, 0, 0, v12);
      v6 = v29;
      v9 = v28;
      v5 = 0;
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v72 = v24;
      v73 = 2112;
      v74 = v25;
      v75 = 2112;
      v76 = v26;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch is configured with reader key for: %@, object got invalidated", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    v27 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v27 + 16))(v27, 0, 0, v12);
  }

}

void __80__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyOnMatterAccessory_flow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "errorOnlyCompletionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configureAccessoryWithNfcReaderKey:accessory:flow:completion:", v5, v10, v9, v11);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or nfc reader key for matter accessory: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(*(id *)(a1 + 48), "finishWithError:", v6);
  }

}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  _BYTE location[12];
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v5)
  {
    objc_initWeak((id *)location, a1[6]);
    v8 = objc_msgSend(a1[6], "supportsCHIP");
    v10 = a1[5];
    v9 = a1[6];
    v11 = a1[4];
    if (v8)
    {
      objc_msgSend(a1[4], "configureAccessoryWithNfcReaderKey:accessory:flow:completion:", v5, a1[6], a1[5], a1[7]);
    }
    else
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_239;
      v17[3] = &unk_1E89BA998;
      v17[4] = v11;
      objc_copyWeak(&v21, (id *)location);
      v18 = a1[5];
      v20 = a1[7];
      v19 = v5;
      objc_msgSend(v11, "fetchIsAccessoryConfiguredWithReaderKey:accessory:flow:completion:", v19, v9, v10, v17);

      objc_destroyWeak(&v21);
    }
    objc_destroyWeak((id *)location);
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch or nfc reader key: %@", location, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    (*((void (**)(void))a1[7] + 2))();
  }

}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_239(id *a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void (*v20)(void);
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void (**v26)(id, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a1[4], "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    if (a2)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1[4];
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = v7;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v8;
        v17 = v11;
        v18 = a1[6];
        objc_msgSend(WeakRetained, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v37 = v14;
        v38 = 2112;
        v39 = v15;
        v40 = 2112;
        v41 = v18;
        v11 = v17;
        v8 = v16;
        v42 = 2112;
        v43 = v19;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Accessory is already configured with nfc reader key %@:%@", buf, 0x2Au);

        v7 = v30;
      }

      objc_autoreleasePoolPop(v11);
      v20 = (void (*)(void))*((_QWORD *)a1[7] + 2);
    }
    else
    {
      if (v7)
      {
        v28 = a1[4];
        v29 = a1[5];
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_240;
        v31[3] = &unk_1E89BDE38;
        v31[4] = v28;
        v35 = a1[7];
        v32 = a1[6];
        v33 = WeakRetained;
        v34 = a1[5];
        objc_msgSend(v28, "removeNfcReaderKeyWithIdentifier:accessory:flow:completion:", v7, v33, v29, v31);

        goto LABEL_12;
      }
      if (!v8)
      {
        objc_msgSend(a1[4], "configureAccessoryWithNfcReaderKey:accessory:flow:completion:", a1[6], WeakRetained, a1[5], a1[7]);
        goto LABEL_12;
      }
      v20 = (void (*)(void))*((_QWORD *)a1[7] + 2);
    }
    v20();
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = a1[4];
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with reader key, accessory object became nil", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v26 = (void (**)(id, void *))a1[7];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2](v26, v27);

  }
LABEL_12:

}

void __93__HMDHomeWalletKeyAccessoryManager_fetchOrConfigureNFCReaderKeyForAccessory_flow_completion___block_invoke_240(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (v4)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "configureAccessoryWithNfcReaderKey:accessory:flow:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __75__HMDHomeWalletKeyAccessoryManager_configureNFCReaderKeyForAccessory_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(a1[5], "setReaderKeyConfigureInProgress:", 0));
  v6 = a1[4];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = v9;
      v23 = 2112;
      v24 = v10;
      v25 = 2112;
      v26 = v11;
      v27 = 2112;
      v28 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to configure accessory with nfc reader key %@:%@", (uint8_t *)&v21, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    if (objc_msgSend(a1[5], "shouldRetryReaderKeyConfigureOnFailure"))
    {
      v12 = (void *)MEMORY[0x1D17BA0A0]();
      v13 = a1[4];
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[7], "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v15;
        v23 = 2112;
        v24 = v16;
        v25 = 2112;
        v26 = v17;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Retrying configuring accessory with nfc reader key: %@", (uint8_t *)&v21, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(a1[5], "setShouldRetryReaderKeyConfigureOnFailure:", 0);
      objc_msgSend(a1[4], "configureNFCReaderKeyForAccessory:flow:", a1[7], a1[6]);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[7], "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured accessory with nfc reader key: %@", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(a1[5], "setReaderKeyConfigured:", 1);
  }

}

void __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_237(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_2;
  block[3] = &unk_1E89C1B48;
  v11 = v6;
  v12 = v5;
  v13 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

}

void __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "hmf_BOOLForKey:", CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyDidSucceed")) & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:userInfo:", 52, v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
}

id __129__HMDHomeWalletKeyAccessoryManager_requestPrimaryResident_toConfigureAccessories_withDeviceCredentialKey_ofType_flow_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_matterAccessoriesSupportingWalletKey__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsWalletKey");
}

void __68__HMDHomeWalletKeyAccessoryManager_handleHomeUserAddedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isPrimaryResidentOrSoleOwnerController"))
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("HMDUserNotificationKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling added user: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);

  }
}

void __68__HMDHomeWalletKeyAccessoryManager_handleWalletKeySupportDidChange___block_invoke(uint64_t a1)
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
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because wallet key support did change on accessory: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "configureNFCReaderKeyForAccessory:flow:", *(_QWORD *)(a1 + 40), v2);

}

void __75__HMDHomeWalletKeyAccessoryManager_handleHomeAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  void *v2;
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
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Last accessory supporting wallet key was removed.", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 40), "updateHasOnboardedForWalletKey:message:", 0, 0);

}

void __73__HMDHomeWalletKeyAccessoryManager_handleHomeAddedAccessoryNotification___block_invoke(uint64_t a1)
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
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D28580], "internalOnlyInitializer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543874;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@[NewFlow: %@] Configuring NFC Reader Key because new accessory was added: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "configureNFCReaderKeyForAccessory:flow:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(*(id *)(a1 + 32), "handlePendingDeviceCredentialKeysSyncForAccessory:withReason:", *(_QWORD *)(a1 + 40), CFSTR("accessory added"));

}

void __83__HMDHomeWalletKeyAccessoryManager_handleHomeDidDisableCharacteristicNotification___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configureNotificationsWithReason:", v2);

}

uint64_t __92__HMDHomeWalletKeyAccessoryManager_handleHomeNFCReaderKeyKeychainItemAvailableNotification___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "nfcReaderKeyConfigureStateByAccessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  return objc_msgSend(*(id *)(a1 + 32), "configureNFCReaderKeyForAllAccessoriesWithReason:", CFSTR("Keychain item available"));
}

void __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentDeviceConfirmedPrimaryResident");
  if ((_DWORD)v3 != objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident"))
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "isCurrentDevicePrimaryResident");
      HMFBooleanToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Current device primary changed from: (%@->%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDevicePrimaryResident:", v3);
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configureNotificationsWithReason:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "pendingPrimaryResidentDeviceCredentialKeyOperation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v2, "accessoriesWithWalletKeySupport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_221;
    v25[3] = &unk_1E89BA910;
    v15 = v12;
    v26 = v15;
    objc_msgSend(v13, "na_filter:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "primaryResidentDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "currentUser");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isOwner") & 1) == 0 && objc_msgSend(v16, "count") && v17)
    {
      v19 = objc_msgSend(*(id *)(a1 + 32), "canConfigureAccessories");

      if (v19)
      {
        v20 = *(void **)(a1 + 32);
        objc_msgSend(v15, "deviceCredentialKey");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D28580], "untrackedPlaceholderFlow");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v14;
        v23[1] = 3221225472;
        v23[2] = __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_2;
        v23[3] = &unk_1E89C21C0;
        v23[4] = *(_QWORD *)(a1 + 32);
        v24 = v15;
        objc_msgSend(v20, "requestPrimaryResident:toConfigureAccessories:withDeviceCredentialKey:ofType:flow:completion:", v17, v16, v21, 0, v22, v23);

      }
    }
    else
    {

    }
  }

}

uint64_t __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_221(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessoriesUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

void __76__HMDHomeWalletKeyAccessoryManager_handlePrimaryResidentUpdateNotification___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Failed to handle pending operation when primary resident updated %@:%@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Successfully handled pending operation when primary resident updated %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "setPendingPrimaryResidentDeviceCredentialKeyOperation:", 0);

}

void __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke_220(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "walletKeyColorPreferenceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberValueFromNoBackupStoreWithKey:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v9;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "walletKeyColorPreferenceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "persistNumberValueToNoBackupStore:withKey:", v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "integerValue"));

    v4 = 0;
  }

}

uint64_t __86__HMDHomeWalletKeyAccessoryManager_handleAccessoryCharacteristicsChangedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("0000026C-0000-1000-8000-0026BB765291"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  char v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "createMatterIssuerKeyDataForUser:withUserIndex:flow:", a1[5], v3, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1[7], "waitForDoorLockClusterObjectWithFlow:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_207;
    v34[3] = &unk_1E89BA800;
    v35 = v4;
    v36 = v3;
    v38 = 1;
    v37 = a1[6];
    objc_msgSend(v5, "then:", v34);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "naFuture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2;
    v31[3] = &unk_1E89BA828;
    v31[4] = a1[4];
    v32 = a1[7];
    v33 = a1[6];
    objc_msgSend(v8, "recover:", v31);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_209;
    v27[3] = &unk_1E89BA850;
    v27[4] = a1[4];
    v28 = a1[6];
    v29 = a1[5];
    v30 = a1[7];
    objc_msgSend(v9, "addFailureBlock:", v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_210;
    v23[3] = &unk_1E89BA878;
    v23[4] = a1[4];
    v24 = a1[7];
    v25 = a1[6];
    v26 = a1[5];
    objc_msgSend(v10, "addSuccessBlock:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_211;
    v21[3] = &unk_1E89BA8A0;
    v22 = a1[7];
    objc_msgSend(v11, "flatMap:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v16;
      v41 = 2112;
      v42 = v17;
      v43 = 2112;
      v44 = v18;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not adding issuer key because we don't have one for user: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

uint64_t __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "addIssuerKeyData:forUserIndex:isUnifiedAccess:flow:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "integerValue"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;

    return 3;
  }
  else
  {
    v7 = _HMFPreconditionFailure();
    return __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2(v7);
  }
}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != (void *)*MEMORY[0x1E0D33258])
  {

LABEL_7:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v3);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "code");

  if (v6 != 8)
    goto LABEL_7;
  v7 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateHomeWalletKeyAddForAccessoryUUID:keyType:", v8, 1);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v12;
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Ignoring duplicate error while adding Issuer key", (uint8_t *)&v17, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v15 = (void *)v14;

  return v15;
}

void __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_209(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to add issuer key for user: %@, to accessory: %@, with error: %@", (uint8_t *)&v11, 0x34u);

  }
  objc_autoreleasePoolPop(v4);

}

void __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_210(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateHomeWalletKeyAddForAccessoryUUID:keyType:", v5, 1);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = a1[4];
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully configured issuer key for user: %@ on accessory: %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v6);

}

id __80__HMDHomeWalletKeyAccessoryManager__addIssuerKeyForUser_toMatterAccessory_flow___block_invoke_211(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __79__HMDHomeWalletKeyAccessoryManager_addIssuerKeyForUser_toMatterAccessory_flow___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_addIssuerKeyForUser:toMatterAccessory:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "completionHandlerAdapter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "addCompletionBlock:", v2);

}

uint64_t __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addIssuerKeyForUser:toMatterAccessory:flow:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

id __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  if (objc_msgSend(v2, "na_any:", &__block_literal_global_205))
  {
    objc_msgSend(v2, "na_map:", &__block_literal_global_206_151534);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __84__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterTTUAccessoriesForUser_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addIssuerKeyForUser:toMatterAccessory:flow:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_203_151537);
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessory_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __74__HMDHomeWalletKeyAccessoryManager_addIssuerKeysToMatterAccessories_flow___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIssuerKeysToMatterAccessory:flow:", a2, *(_QWORD *)(a1 + 40));
}

void __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke(id *a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "matterAccessoriesSupportingWalletKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_isEmpty");

  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = a1[4];
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] No Matter accessories supporting wallet key, so nothing to add Issuer key to.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(a1[6], "respondWithSuccess");
  }
  v9 = a1[4];
  objc_msgSend(v9, "matterAccessoriesSupportingWalletKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addIssuerKeysToMatterAccessories:flow:", v10, a1[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_201;
  v17[3] = &unk_1E89BA2C0;
  v18 = a1[6];
  objc_msgSend(v11, "addSuccessBlock:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v12;
  v15[1] = 3221225472;
  v15[2] = __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_2;
  v15[3] = &unk_1E89C2350;
  v16 = a1[6];
  v14 = (id)objc_msgSend(v13, "addFailureBlock:", v15);

}

uint64_t __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_201(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithSuccess");
}

uint64_t __77__HMDHomeWalletKeyAccessoryManager__handleAddIssuerKeysToAccessoriesMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

id __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
    if (v6)
    {
      objc_msgSend(a1[4], "home");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessoryWithUUID:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
      v10 = v9;

      if (v10)
        goto LABEL_20;
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = a1[4];
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v14;
        v29 = 2112;
        v30 = v15;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, accessory with uuid: %@ not found", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(a1[6], "addObject:", v6);
    }
    else
    {
      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = a1[4];
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "UUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v24;
        v29 = 2112;
        v30 = v25;
        v31 = 2112;
        v32 = v5;
        v33 = 2112;
        v34 = objc_opt_class();
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, failed to convert accessory uuid: %@ to: %@", (uint8_t *)&v27, 0x2Au);

      }
      objc_autoreleasePoolPop(v21);
    }
    v10 = 0;
LABEL_20:

    goto LABEL_21;
  }
  v16 = (void *)MEMORY[0x1D17BA0A0]();
  v17 = a1[4];
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138544130;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v31 = 2112;
    v32 = v3;
    v33 = 2112;
    v34 = objc_opt_class();
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Not configuring accessory with device credential key, unknown type for uuid: %@ expected: %@", (uint8_t *)&v27, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  v10 = 0;
LABEL_21:

  return v10;
}

void __93__HMDHomeWalletKeyAccessoryManager_handleConfigureAccessoriesWithDeviceCredentialKeyMessage___block_invoke_200(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1[4], "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = a1[4];
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[6];
      *(_DWORD *)buf = 138544130;
      v20 = v9;
      v21 = 2112;
      v22 = v10;
      v23 = 2112;
      v24 = v11;
      v25 = 2112;
      v26 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to handle configure device credential key message %@:%@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v5);
    objc_msgSend(a1[6], "respondWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[6];
      *(_DWORD *)buf = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v14;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Successfully handled configure device credential key message: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    v15 = a1[6];
    v17 = CFSTR("HMDHomeConfigureAccessoriesWithDeviceCredentialKeyMessageKeyDidSucceed");
    v18 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "respondWithPayload:", v16);

  }
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_190(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CBA690];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:userUUID:", v6, v7);
  return v8;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2_192(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
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
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "credentials");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "na_map:", &__block_literal_global_195_151563);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uuid");
        v33 = v20;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v35 = v23;
        v36 = 2112;
        v37 = v24;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] User does not have at least 1 RFID credentials on accessory: %@, user: %@", buf, 0x2Au);

        v20 = v33;
      }

      objc_autoreleasePoolPop(v20);
      v27 = objc_alloc(MEMORY[0x1E0CBA690]);
      v28 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v27, "initWithAccessoryUUID:userUUID:", v28, v30);

    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v35 = v13;
      v36 = 2112;
      v37 = v14;
      v38 = 2112;
      v39 = v15;
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Matter user is missing on accessory: %@, user: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v10);
    v18 = objc_alloc(MEMORY[0x1E0CBA690]);
    v19 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v18, "initWithAccessoryUUID:userUUID:", v19, v8);
  }

  return v9;
}

id __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_193(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  id v5;

  v2 = a2;
  objc_msgSend(v2, "credentialType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToNumber:", *MEMORY[0x1E0D33140]);

  if (v4)
    v5 = v2;
  else
    v5 = 0;

  return v5;
}

uint64_t __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "credentialType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __116__HMDHomeWalletKeyAccessoryManager_missingWalletKeysForAccessoryUUID_usersByUniqueID_accessoryUsersByUniqueID_flow___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "userUniqueID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

id __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", *MEMORY[0x1E0D33268]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "getUsersWithUniqueIDs:flow:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "naFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "na_dictionaryWithKeyGenerator:", &__block_literal_global_185_151572);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "missingWalletKeysForAccessoryUUID:usersByUniqueID:accessoryUsersByUniqueID:flow:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userUniqueID");
}

uint64_t __82__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessory_users_flow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIDForAccessories");
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_173(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v9 = a1[5];
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a2;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchMissingWalletKeysForAccessory:users:flow:", v5, v6, a1[6], v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v18 = 138544130;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      v14 = "%{public}@[Flow: %@] Found missing wallet keys for userUUID: %@ missing wallet keys: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v15, v16, v14, (uint8_t *)&v18, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 48);
    v18 = 138544130;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v6;
    v14 = "%{public}@[Flow: %@] Failed to fetch missing wallet keys for userUUID: %@, error: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "na_map:", &__block_literal_global_179);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setByFlattening");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __75__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForUserUUID_flow___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP");
}

void __88__HMDHomeWalletKeyAccessoryManager_fetchMissingWalletKeysForAccessoryUUID_forUser_flow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v18 = 138544130;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      v14 = "%{public}@[Flow: %@] Found missing wallet keys for accessoryUUID: %@ missing wallet keys: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v15, v16, v14, (uint8_t *)&v18, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 48);
    v18 = 138544130;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v17;
    v24 = 2112;
    v25 = v6;
    v14 = "%{public}@[Flow: %@] Failed to fetch missing wallet keys for accessoryUUID: %@, error: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

uint64_t __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", *(_QWORD *)(a1 + 40));
}

void __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3;
  v18[3] = &unk_1E89BA2E8;
  v4 = *(void **)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 40);
  v19 = v4;
  objc_msgSend(v2, "na_map:", v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_158;
  v15[3] = &unk_1E89BA378;
  v15[4] = *(_QWORD *)(a1 + 40);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v5, "na_map:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "combineAllFutures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_4;
  v10[3] = &unk_1E89BA408;
  v8 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v10);

}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to find HMDUser with UUID: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v6;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_addIssuerKeyForUser:toMatterAccessory:flow:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flatMap:", &__block_literal_global_161_151594);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3_162;
  v9[3] = &unk_1E89BA350;
  v10 = v3;
  v6 = v3;
  objc_msgSend(v5, "recover:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "na_map:", &__block_literal_global_167_151590);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_168;
    v12[3] = &unk_1E89BA3E0;
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v4, "na_map:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Error while restoring wallet keys: Failed to get results.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 56));
  }

}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_168(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CBA690];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccessoryUUID:userUUID:", v6, v4);

  return v7;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_165(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_3_162(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __78__HMDHomeWalletKeyAccessoryManager_restoreMissingWalletKeys_onAccessory_flow___block_invoke_2_159()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

id __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryWithUUID:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "restoreMissingWalletKeys:onAccessory:flow:", v6, v11, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "asSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_setByFlattening");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v8 = *MEMORY[0x1E0CB9370];
  encodeRootObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "respondWithPayload:", v7);

}

uint64_t __74__HMDHomeWalletKeyAccessoryManager_handleRestoreMissingWalletKeysMessage___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessoryUUID");
}

void __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0CB9370];
  encodeRootObject();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "respondWithPayload:", v3);

}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

void __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0CB9370];
  encodeRootObject();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "respondWithPayload:", v3);

}

uint64_t __72__HMDHomeWalletKeyAccessoryManager_handleFetchMissingWalletKeysMessage___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
}

void __69__HMDHomeWalletKeyAccessoryManager_handleFetchWalletKeyColorMessage___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = *MEMORY[0x1E0CB8DB0];
    v8[0] = a2;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "respondWithPayload:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a3);
    v6 = 0;
  }

}

void __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a3, "hmf_numberForKey:", *MEMORY[0x1E0CB8DB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "walletKeyColorPreferenceKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistNumberValueToNoBackupStore:withKey:", v5, v7);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryManager:didUpdateWalletKeyColor:", *(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__HMDHomeWalletKeyAccessoryManager_fetchWalletKeyColorWithFlow_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "supportsCHIP");
}

uint64_t __54__HMDHomeWalletKeyAccessoryManager_configureWithHome___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDevicePrimaryResident:", objc_msgSend(*(id *)(a1 + 40), "isCurrentDeviceConfirmedPrimaryResident"));
  return objc_msgSend(*(id *)(a1 + 32), "configureNotificationsWithReason:", CFSTR("configure"));
}

+ (id)createMatterIssuerKeyDataForUser:(id)a3 withUserIndex:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0D16510]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D16568]), "initWithValue:", 1);
  objc_msgSend(v11, "setType:", v12);

  objc_msgSend(v8, "pairingIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publicKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKey:", v15);

  v16 = objc_alloc_init(MEMORY[0x1E0D16518]);
  objc_msgSend(v16, "setIssuerKey:", v11);
  v28 = 0;
  objc_msgSend(v16, "serializeWithError:", &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    v20 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = a1;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = v9;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v26 = v20;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      v33 = 2112;
      v34 = v8;
      v35 = 2048;
      v36 = v27;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to serialize issuer key for user: %@ with user index: %ld with error: %@", buf, 0x34u);

      v20 = v26;
      v9 = v27;
    }

    objc_autoreleasePoolPop(v20);
  }

  return v17;
}

void __47__HMDHomeWalletKeyAccessoryManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v209;
  logCategory__hmf_once_v209 = v0;

}

@end
