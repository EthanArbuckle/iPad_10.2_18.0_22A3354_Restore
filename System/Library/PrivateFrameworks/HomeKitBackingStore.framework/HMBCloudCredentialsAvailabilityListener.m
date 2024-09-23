@implementation HMBCloudCredentialsAvailabilityListener

- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HMBCloudCredentialsAvailabilityListener *v7;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBCloudCredentialsAvailabilityListener initWithContainer:notificationCenter:](self, "initWithContainer:notificationCenter:", v5, v6);

  return v7;
}

- (HMBCloudCredentialsAvailabilityListener)initWithContainer:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  HMBCloudCredentialsAvailabilityListener *v9;
  HMBCloudCredentialsAvailabilityListener *v10;
  id keychainAvailabilityTimerFactory;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMBCloudCredentialsAvailabilityListener;
  v9 = -[HMBCloudCredentialsAvailabilityListener init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_container, a3);
    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    keychainAvailabilityTimerFactory = v10->_keychainAvailabilityTimerFactory;
    v10->_keychainAvailabilityTimerFactory = &__block_literal_global_324;

  }
  return v10;
}

- (id)waitForAccountAvailability
{
  return -[HMBCloudCredentialsAvailabilityListener _waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:]((os_unfair_lock_s *)self, 0);
}

- (id)waitForAccountAvailabilityAndRecheckIfAlreadyAvailable
{
  return -[HMBCloudCredentialsAvailabilityListener _waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:]((os_unfair_lock_s *)self, 1);
}

- (id)waitForKeychainAvailability
{
  hmf_unfair_data_lock_s *p_lock;
  uint64_t Property;
  const char *v5;
  const char *v6;
  char v7;
  void *v8;
  HMBCloudCredentialsAvailabilityListener *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, double);
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  id v19;
  const char *v20;
  SEL v21;
  SEL v22;
  id v23;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  Property = os_unfair_lock_lock_with_options();
  if (self)
  {
    Property = (uint64_t)objc_getProperty(self, v5, 40, 1);
    if (Property)
    {
      v7 = 0;
LABEL_10:
      v18 = objc_getProperty(self, v6, 40, 1);
      goto LABEL_11;
    }
  }
  v8 = (void *)MEMORY[0x1D17B6230](Property);
  v9 = self;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v11;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@Will wait for keychain availability", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  v13 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  if (self)
    objc_setProperty_atomic(v9, v12, v13, 40);

  -[HMBCloudCredentialsAvailabilityListener keychainAvailabilityTimerFactory](v9, "keychainAvailabilityTimerFactory");
  v14 = (void (**)(_QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v14[2](v14, 0, 600.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  if (self)
  {
    objc_setProperty_atomic(v9, v16, v15, 48);

    v7 = 1;
    goto LABEL_10;
  }

  v18 = 0;
  v7 = 1;
LABEL_11:
  v19 = v18;
  os_unfair_lock_unlock(&p_lock->lock);
  if ((v7 & 1) != 0)
  {
    if (self)
    {
      objc_msgSend(objc_getProperty(self, v20, 24, 1), "addObserver:selector:name:object:", self, sel_handleIdentityUpdateNotification_, *MEMORY[0x1E0C94870], 0);
      objc_msgSend(objc_getProperty(self, v21, 48, 1), "setDelegate:", self);
      v23 = objc_getProperty(self, v22, 48, 1);
    }
    else
    {
      objc_msgSend(0, "addObserver:selector:name:object:", 0, sel_handleIdentityUpdateNotification_, *MEMORY[0x1E0C94870], 0);
      objc_msgSend(0, "setDelegate:", 0);
      v23 = 0;
    }
    objc_msgSend(v23, "resume");
  }
  return v19;
}

- (void)handleAccountChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMBCloudCredentialsAvailabilityListener *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling CKAccountChangedNotification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudCredentialsAvailabilityListener _checkAccountAvailability](v6);

}

- (void)handleIdentityUpdateNotification:(id)a3
{
  id v4;
  void *v5;
  HMBCloudCredentialsAvailabilityListener *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17B6230]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CCD48000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling CKIdentityUpdateNotification", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMBCloudCredentialsAvailabilityListener _handleKeychainAvailabilityChanged]((os_unfair_lock_s *)v6);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  if (self)
    self = (HMBCloudCredentialsAvailabilityListener *)objc_getProperty(self, a2, 16, 1);
  -[HMBCloudCredentialsAvailabilityListener containerID](self, "containerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)timerDidFire:(id)a3
{
  const char *v4;
  id v5;
  id Property;
  void *v7;
  HMBCloudCredentialsAvailabilityListener *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 48, 1);
  else
    Property = 0;
  if (Property == v5)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling keychain availability timer", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMBCloudCredentialsAvailabilityListener _handleKeychainAvailabilityChanged]((os_unfair_lock_s *)v8);
  }

}

- (id)keychainAvailabilityTimerFactory
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setKeychainAvailabilityTimerFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keychainAvailabilityTimerFactory, 0);
  objc_storeStrong((id *)&self->_keychainAvailabilityTimer, 0);
  objc_storeStrong((id *)&self->_keychainAvailabilityFuture, 0);
  objc_storeStrong((id *)&self->_accountAvailabilityFuture, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)_handleKeychainAvailabilityChanged
{
  os_unfair_lock_s *v2;
  SEL v3;
  SEL v4;
  SEL v5;
  SEL v6;
  id v7;
  id v8;

  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock_with_options();
    v8 = objc_getProperty(a1, v3, 40, 1);
    objc_setProperty_atomic(a1, v4, 0, 40);
    objc_setProperty_atomic(a1, v5, 0, 48);
    v7 = objc_getProperty(a1, v6, 24, 1);
    objc_msgSend(v7, "removeObserver:name:object:", a1, *MEMORY[0x1E0C94870], 0);

    os_unfair_lock_unlock(v2);
    objc_msgSend(v8, "finishWithNoResult");

  }
}

- (void)_checkAccountAvailability
{
  void *v2;
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  SEL v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Check account availability"));
    v2 = (void *)MEMORY[0x1D17B6230]();
    v3 = a1;
    HMFGetOSLogHandle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2114;
      v16 = v7;
      _os_log_impl(&dword_1CCD48000, v4, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching account info", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    v9 = objc_getProperty(v3, v8, 16, 1);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__HMBCloudCredentialsAvailabilityListener__checkAccountAvailability__block_invoke;
    v10[3] = &unk_1E8931318;
    v10[4] = v3;
    v11 = v12;
    objc_msgSend(v9, "accountInfoWithCompletionHandler:", v10);

    __HMFActivityScopeLeave();
  }
}

void __68__HMBCloudCredentialsAvailabilityListener__checkAccountAvailability__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  id Property;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  id v31;
  uint64_t v32;
  const char *v33;
  id v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17B6230]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543874;
      v36 = v18;
      v37 = 2114;
      v38 = v20;
      v39 = 2112;
      v40 = v6;
      v21 = "%{public}@[%{public}@] Failed to fetch account info: %@";
      v22 = v10;
      v23 = 32;
LABEL_19:
      _os_log_impl(&dword_1CCD48000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v35, v23);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543874;
    v36 = v11;
    v37 = 2114;
    v38 = v13;
    v39 = 2112;
    v40 = v5;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetched account info: %@", (uint8_t *)&v35, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (objc_msgSend(v5, "accountStatus") != 1)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v18;
      v37 = 2114;
      v38 = v20;
      v21 = "%{public}@[%{public}@] CloudKit account is not currently available; waiting for CKAccountChangedNotification to check again";
      goto LABEL_18;
    }
LABEL_20:

    objc_autoreleasePoolPop(v7);
    goto LABEL_21;
  }
  if ((objc_msgSend(v5, "hasValidCredentials") & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17B6230]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v18;
      v37 = 2114;
      v38 = v20;
      v21 = "%{public}@[%{public}@] Account does not have valid credentials; waiting for CKAccountChangedNotification to check again";
      goto LABEL_18;
    }
    goto LABEL_20;
  }
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, v14, 16, 1);
  objc_msgSend(Property, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "useZoneWidePCS"))
  {
    v17 = objc_msgSend(v5, "supportsDeviceToDeviceEncryption");

    if ((v17 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1D17B6230]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138543618;
        v36 = v18;
        v37 = 2114;
        v38 = v20;
        v21 = "%{public}@[%{public}@] Manatee is not currently available; waiting for CKAccountChangedNotification to check again";
LABEL_18:
        v22 = v10;
        v23 = 22;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  else
  {

  }
  v24 = (void *)MEMORY[0x1D17B6230]();
  v25 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138543618;
    v36 = v27;
    v37 = 2114;
    v38 = v29;
    _os_log_impl(&dword_1CCD48000, v26, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Account is available", (uint8_t *)&v35, 0x16u);

  }
  objc_autoreleasePoolPop(v24);
  v31 = *(id *)(a1 + 32);
  if (v31)
  {
    v31 = objc_getProperty(v31, v30, 24, 1);
    v32 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v32 = 0;
  }
  objc_msgSend(v31, "removeObserver:name:object:", v32, *MEMORY[0x1E0C94690], 0);
  v34 = *(id *)(a1 + 32);
  if (v34)
    v34 = objc_getProperty(v34, v33, 32, 1);
  objc_msgSend(v34, "finishWithNoResult");
LABEL_21:

}

- (id)_waitForAccountAvailabilityAndRecheckIfAlreadyAvailable:(os_unfair_lock_s *)a1
{
  os_unfair_lock_s *v4;
  SEL v5;
  const char *v6;
  id v7;
  int v8;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  os_unfair_lock_s *v14;
  NSObject *v15;
  id v16;
  id v17;
  SEL v18;
  const char *v19;
  char v20;
  void *v21;
  id v22;
  SEL v23;
  id v24;
  const char *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id Property;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = a1 + 2;
  os_unfair_lock_lock_with_options();
  if (objc_getProperty(a1, v5, 32, 1))
  {
    if (!a2
      || (v7 = objc_getProperty(a1, v6, 32, 1), v8 = objc_msgSend(v7, "isFinished"),
                                                               v7,
                                                               !v8))
    {
      v13 = (void *)MEMORY[0x1D17B6230]();
      v14 = a1;
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v27 = 138543874;
        v28 = v16;
        v29 = 2112;
        v30 = v17;
        v31 = 2112;
        Property = objc_getProperty(v14, v18, 32, 1);
        _os_log_impl(&dword_1CCD48000, v15, OS_LOG_TYPE_INFO, "%{public}@Skipping re-check with should check: %@ account available future: %@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      v20 = 1;
      goto LABEL_14;
    }
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v12;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Will reset and re-check account availability", (uint8_t *)&v27, 0xCu);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B6230]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v21;
      _os_log_impl(&dword_1CCD48000, v11, OS_LOG_TYPE_INFO, "%{public}@Will wait for account availability", (uint8_t *)&v27, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v9);
  v22 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_setProperty_atomic(v10, v23, v22, 32);

  v20 = 0;
LABEL_14:
  v24 = objc_getProperty(a1, v19, 32, 1);
  os_unfair_lock_unlock(v4);
  if ((v20 & 1) == 0)
  {
    objc_msgSend(objc_getProperty(a1, v25, 24, 1), "addObserver:selector:name:object:", a1, sel_handleAccountChangedNotification_, *MEMORY[0x1E0C94690], 0);
    -[HMBCloudCredentialsAvailabilityListener _checkAccountAvailability](a1);
  }
  return v24;
}

id __80__HMBCloudCredentialsAvailabilityListener_initWithContainer_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", a3, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t16 != -1)
    dispatch_once(&logCategory__hmf_once_t16, &__block_literal_global_11);
  return (id)logCategory__hmf_once_v17;
}

void __54__HMBCloudCredentialsAvailabilityListener_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v17;
  logCategory__hmf_once_v17 = v0;

}

@end
