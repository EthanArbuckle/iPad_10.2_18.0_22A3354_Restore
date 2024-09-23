@implementation HAPKeyBag

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HAPKeyBag *v10;
  HAPKeyBag *v12;
  SEL v13;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    -[HAPKeyBag _populateBagWithPairingIdentitiesForAccessory:fromStore:](self, "_populateBagWithPairingIdentitiesForAccessory:fromStore:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HAPKeyBag initWithAccessoryIdentifier:keyStore:controllerKeyList:](self, "initWithAccessoryIdentifier:keyStore:controllerKeyList:", v6, v8, v9);

    return v10;
  }
  else
  {
    v12 = (HAPKeyBag *)_HMFPreconditionFailure();
    return -[HAPKeyBag initWithAccessoryIdentifier:keyStore:controllerKeyList:](v12, v13, v14, v15, v16);
  }
}

- (HAPKeyBag)initWithAccessoryIdentifier:(id)a3 keyStore:(id)a4 controllerKeyList:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HAPKeyBag *v13;
  HAPKeyBag *v14;
  uint64_t v15;
  NSArray *availableKeysToTry;
  void *v17;
  HAPKeyBag *v18;
  NSObject *v19;
  void *v20;
  NSString *accessoryIdentifier;
  void *v22;
  void *v23;
  void *v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    _HMFPreconditionFailure();
  v12 = v11;
  v26.receiver = self;
  v26.super_class = (Class)HAPKeyBag;
  v13 = -[HAPKeyBag init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryIdentifier, a3);
    objc_storeWeak((id *)&v14->_keyStore, v10);
    v14->_currentIndexInBag = -1;
    v15 = objc_msgSend(v12, "copy");
    availableKeysToTry = v14->_availableKeysToTry;
    v14->_availableKeysToTry = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v14;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      accessoryIdentifier = v14->_accessoryIdentifier;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v14->_availableKeysToTry, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](v14->_availableKeysToTry, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v28 = v20;
      v29 = 2112;
      v30 = accessoryIdentifier;
      v17 = v25;
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Initialized key bag for accessory [%@] with %@ keys and primary identity: [%@]", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v17);
  }

  return v14;
}

- (void)refreshKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *availableKeysToTry;
  void *v10;
  HAPKeyBag *v11;
  NSObject *v12;
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
  -[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _HMFPreconditionFailure();
LABEL_10:
    _HMFPreconditionFailure();
  }
  -[HAPKeyBag keyStore](self, "keyStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_10;
  -[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeyBag keyStore](self, "keyStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeyBag _populateBagWithPairingIdentitiesForAccessory:fromStore:](self, "_populateBagWithPairingIdentitiesForAccessory:fromStore:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock_with_options();
  if ((HMFEqualObjects() & 1) != 0)
  {
    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    availableKeysToTry = self->_availableKeysToTry;
    self->_availableKeysToTry = v8;

    self->_currentIndexInBag = -1;
    os_unfair_lock_unlock(&self->_lock);
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPKeyBag accessoryIdentifier](v11, "accessoryIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Refreshed key bag for accessory [%@] with identities: [%@]", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)_populateBagWithPairingIdentitiesForAccessory:(id)a3 fromStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  HAPKeyBag *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "allAccessoryPairingKeys");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = v10;
  else
    v12 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v9, "arrayWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getAssociatedControllerKeyForAccessory:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (objc_msgSend(v7, "readControllerPairingKeyForAccessory:error:", v6, 0),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v13, "removeObject:", v14);
    objc_msgSend(v13, "insertObject:atIndex:", v14, 0);

  }
  if (objc_msgSend(v13, "hmf_isEmpty"))
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@This is strange. We do not have any controller keys in the key chain.", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
  v19 = (void *)objc_msgSend(v13, "copy");

  objc_autoreleasePoolPop(v8);
  return v19;
}

- (int64_t)getCurrentIndexInBag
{
  os_unfair_lock_s *p_lock;
  int64_t currentIndexInBag;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  currentIndexInBag = self->_currentIndexInBag;
  os_unfair_lock_unlock(p_lock);
  return currentIndexInBag;
}

- (void)setCurrentIndexInBag:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_currentIndexInBag = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isValidIndex:(int64_t)a3
{
  void *v4;
  BOOL v5;

  if (a3 < 0)
    return 0;
  -[HAPKeyBag availableKeysToTry](self, "availableKeysToTry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") > (unint64_t)a3;

  return v5;
}

- (id)nextIdentity
{
  void *v4;
  void *v5;
  HAPKeyBag *v6;
  NSObject *v7;
  void *v8;
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
  if (-[HAPKeyBag isEmpty](self, "isEmpty"))
    return 0;
  -[HAPKeyBag setCurrentIndexInBag:](self, "setCurrentIndexInBag:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") + 1);
  -[HAPKeyBag currentIdentity](self, "currentIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1D17B7244]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HAPKeyBag currentIndexInBag](v6, "currentIndexInBag"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    -[HAPKeyBag availableKeysToTry](v6, "availableKeysToTry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Fetching Identity [%@] at index : %@, total keys: [%@]", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  return v4;
}

- (id)currentIdentity
{
  void *v3;
  void *v4;
  void *v5;
  HAPKeyBag *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") == -1)
    -[HAPKeyBag setCurrentIndexInBag:](self, "setCurrentIndexInBag:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag") + 1);
  if (-[HAPKeyBag isValidIndex:](self, "isValidIndex:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag")))
  {
    -[HAPKeyBag availableKeysToTry](self, "availableKeysToTry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", -[HAPKeyBag currentIndexInBag](self, "currentIndexInBag"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%{public}@Current Identity [%@]", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[HAPKeyBag availableKeysToTry](self, "availableKeysToTry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_isEmpty");

  return v3;
}

- (unint64_t)totalIdentities
{
  void *v2;
  unint64_t v3;

  -[HAPKeyBag availableKeysToTry](self, "availableKeysToTry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)logIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HAPKeyBag accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HAPKeyBag getCurrentIndexInBag](self, "getCurrentIndexInBag"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAPKeyBag totalIdentities](self, "totalIdentities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (%@/%@)"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)availableKeysToTry
{
  return self->_availableKeysToTry;
}

- (void)setAvailableKeysToTry:(id)a3
{
  objc_storeStrong((id *)&self->_availableKeysToTry, a3);
}

- (HAPKeyStore)keyStore
{
  return (HAPKeyStore *)objc_loadWeakRetained((id *)&self->_keyStore);
}

- (int64_t)currentIndexInBag
{
  return self->_currentIndexInBag;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyStore);
  objc_storeStrong((id *)&self->_availableKeysToTry, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8 != -1)
    dispatch_once(&logCategory__hmf_once_t8, &__block_literal_global);
  return (id)logCategory__hmf_once_v9;
}

void __24__HAPKeyBag_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9;
  logCategory__hmf_once_v9 = v0;

}

@end
