@implementation HAPSystemKeychainStore

- (HAPSystemKeychainStore)init
{
  HAPSystemKeychainStore *v2;
  HAPSystemKeychainStore *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HAPSystemKeychainStore;
  v2 = -[HAPSystemKeychainStore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_keychainStoreUpdatedNotificationToken = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.HAPSystemKeychainStore", v4);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (void)configure
{
  NSObject *v3;
  uint32_t v4;
  void *v5;
  HAPSystemKeychainStore *v6;
  NSObject *v7;
  void *v8;
  _QWORD handler[4];
  id v10;
  id location;
  int out_token;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint32_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  out_token = -1;
  objc_initWeak(&location, self);
  -[HAPSystemKeychainStore queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__HAPSystemKeychainStore_configure__block_invoke;
  handler[3] = &unk_1E894A158;
  objc_copyWeak(&v10, &location);
  v4 = notify_register_dispatch("com.apple.security.view-change.Home", &out_token, v3, handler);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17B7244]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to register for keychain update notification: %u", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    -[HAPSystemKeychainStore setKeychainStoreUpdatedNotificationToken:](self, "setKeychainStoreUpdatedNotificationToken:", out_token);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int keychainStoreUpdatedNotificationToken;
  objc_super v4;

  keychainStoreUpdatedNotificationToken = self->_keychainStoreUpdatedNotificationToken;
  if (keychainStoreUpdatedNotificationToken != -1)
    notify_cancel(keychainStoreUpdatedNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)HAPSystemKeychainStore;
  -[HAPSystemKeychainStore dealloc](&v4, sel_dealloc);
}

- (id)dumpState
{
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 60; i += 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)&dumpState_keyTypes[i]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v5, 0, 1, &v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "description", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0D27EF8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v14;
}

- (BOOL)isHH2Enabled
{
  if (-[HAPSystemKeychainStore unitTest_enable_hh2](self, "unitTest_enable_hh2"))
    return 1;
  if (HAPIsHH2Enabled_onceToken != -1)
    dispatch_once(&HAPIsHH2Enabled_onceToken, &__block_literal_global_11472);
  return HAPIsHH2Enabled_hh2Enabled;
}

- (void)ensureControllerKeyExistsForAllViews
{
  void *v4;
  HAPSystemKeychainStore *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v14 = v7;
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@-[%@ %@] no-op in ROAR", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    -[HAPSystemKeychainStore queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__HAPSystemKeychainStore_ensureControllerKeyExistsForAllViews__block_invoke;
    block[3] = &unk_1E894DD08;
    block[4] = self;
    dispatch_async(v11, block);

  }
}

- (id)getLocalPairingIdentity:(id *)a3
{
  return -[HAPSystemKeychainStore _getLocalPairingIdentityAllowingCreation:error:](self, "_getLocalPairingIdentityAllowingCreation:error:", 0, a3);
}

- (id)getOrCreateLocalPairingIdentity:(id *)a3
{
  return -[HAPSystemKeychainStore _getLocalPairingIdentityAllowingCreation:error:](self, "_getLocalPairingIdentityAllowingCreation:error:", 1, a3);
}

- (id)_getLocalPairingIdentityAllowingCreation:(BOOL)a3 error:(id *)a4
{
  BOOL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HAPPairingIdentity *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  HAPSystemKeychainStore *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  void *v22;
  void *context;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = 0;
  v24 = 0;
  v25 = 0;
  v6 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:username:allowCreation:error:](self, "getControllerPublicKey:secretKey:username:allowCreation:error:", &v27, &v26, &v25, a3, &v24);
  v7 = v27;
  v8 = v26;
  v9 = v25;
  v10 = v24;
  if (v6)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v7);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v8);
    v13 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v9, v11, v12, 0);
    if (!v13)
    {
      context = (void *)MEMORY[0x1D17B7244]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("< Redacted with length %tu >"), objc_msgSend(v8, "length"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v29 = v22;
        v30 = 2112;
        v31 = v9;
        v32 = 2112;
        v33 = v7;
        v34 = 2112;
        v35 = v21;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pairing identity with identifier, %@, public key, %@, private key, %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(context);
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to retrieve local pairing identity."), CFSTR("Failed to create pairing identity"), 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17B7244]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v19;
      v30 = 2114;
      v31 = v10;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the local pairing identity with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 error:(id *)a7
{
  return -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](self, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", a3, a4, 0, a5, a6, a7);
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 error:(id *)a8
{
  NSObject *v12;
  char v13;
  _QWORD block[11];
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  char v53;

  v50 = 0;
  v51 = &v50;
  v52 = 0x2020000000;
  v53 = 0;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__4793;
  v48 = __Block_byref_object_dispose__4794;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__4793;
  v42 = __Block_byref_object_dispose__4794;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__4793;
  v36 = __Block_byref_object_dispose__4794;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4793;
  v30 = __Block_byref_object_dispose__4794;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4793;
  v24 = __Block_byref_object_dispose__4794;
  v25 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__HAPSystemKeychainStore_getControllerPublicKey_secretKey_keyPair_username_allowCreation_error___block_invoke;
  block[3] = &unk_1E894A180;
  block[4] = self;
  block[5] = &v44;
  block[6] = &v38;
  block[7] = &v32;
  v19 = a7;
  block[8] = &v26;
  block[9] = &v20;
  block[10] = &v50;
  dispatch_sync(v12, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v45[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v39[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v33[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v21[5]);
  v13 = *((_BYTE *)v51 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  return v13;
}

- (int)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  int v16;
  int v18;
  _BYTE __s[32];
  _BYTE v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  -[HAPSystemKeychainStore _getControllerKeychainItemError:](self, "_getControllerKeychainItemError:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v18)
  {
    objc_msgSend(v10, "valueData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = _deserializeDataToKeyPair(v12, (uint64_t)v20, (uint64_t)__s);

  }
  if (a3)
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v20, 32);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v13;

      if (!a4)
        goto LABEL_12;
      goto LABEL_7;
    }
    *a3 = 0;
  }
  if (!a4)
    goto LABEL_12;
LABEL_7:
  if (v18)
  {
    *a4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v14;

  }
LABEL_12:
  if (a5)
  {
    objc_msgSend(v11, "valueData");
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a6)
  {
    if (v18)
    {
      *a6 = 0;
    }
    else
    {
      objc_msgSend(v11, "account");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v15;

    }
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  v16 = v18;

  return v16;
}

- (id)_getControllerKeychainItemError:(int *)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v9;
  uint64_t v11;
  void *v12;
  HAPSystemKeychainStore *v13;
  NSObject *v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  void *v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v5 = deviceSupportsKeychainSync();
  if (v5)
    v6 = &unk_1E8989428;
  else
    v6 = &unk_1E8989470;
  -[HAPSystemKeychainStore _getControllerKeychainItemForKeyType:error:](self, "_getControllerKeychainItemForKeyType:error:", v6, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 != -25293 && v18 != 0)
  {
    -[HAPSystemKeychainStore _getControllerKeychainItemForKeyType:error:](self, "_getControllerKeychainItemForKeyType:error:", &unk_1E8989440, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 == -25293 || !v18)
    {
      v7 = v9;
      goto LABEL_11;
    }
    -[HAPSystemKeychainStore _getControllerKeychainItemForKeyType:error:](self, "_getControllerKeychainItemForKeyType:error:", &unk_1E8989458, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != -25293)
    {
      if (v18)
      {
        if (v5)
        {
          -[HAPSystemKeychainStore _getControllerKeychainItemForKeyType:error:](self, "_getControllerKeychainItemForKeyType:error:", &unk_1E8989470, &v18);
          v11 = objc_claimAutoreleasedReturnValue();

          if (v18 == -25293 || !v18)
            goto LABEL_25;
          v12 = (void *)MEMORY[0x1D17B7244]();
          v13 = self;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v20 = v15;
            _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No controller key", buf, 0xCu);

          }
        }
        else
        {
          v12 = (void *)MEMORY[0x1D17B7244]();
          v16 = self;
          HMFGetOSLogHandle();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            HMFGetLogIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v20 = v17;
            _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No controller key", buf, 0xCu);

          }
          v11 = (uint64_t)v7;
        }

        objc_autoreleasePoolPop(v12);
LABEL_25:
        v7 = (void *)v11;
      }
    }
  }
LABEL_11:
  if (a3)
    *a3 = v18;
  return v7;
}

- (id)_getControllerKeychainItemForKeyType:(id)a3 error:(int *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  int v19;
  int *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), a3, 0, 1, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v26)
  {
    v18 = 0;
    if (!a4)
      goto LABEL_22;
    goto LABEL_21;
  }
  if ((unint64_t)objc_msgSend(v6, "count") < 2
    || (-[HAPSystemKeychainStore activeControllerIdentifier](self, "activeControllerIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_22;
      goto LABEL_21;
    }
    v18 = 0;
    v19 = -6764;
LABEL_14:
    v26 = v19;
    if (!a4)
      goto LABEL_22;
    goto LABEL_21;
  }
  v21 = a4;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (!v10)
  {
LABEL_12:

    a4 = v21;
LABEL_13:
    v18 = 0;
    v19 = -6727;
    goto LABEL_14;
  }
  v11 = v10;
  v12 = *(_QWORD *)v23;
LABEL_6:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v12)
      objc_enumerationMutation(v9);
    v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
    objc_msgSend(v14, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPSystemKeychainStore activeControllerIdentifier](self, "activeControllerIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqualToString:", v16);

    if ((v17 & 1) != 0)
      break;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v11)
        goto LABEL_6;
      goto LABEL_12;
    }
  }
  v18 = v14;

  a4 = v21;
  if (!v18)
    goto LABEL_13;
  if (v21)
LABEL_21:
    *a4 = v26;
LABEL_22:

  return v18;
}

- (BOOL)saveLocalPairingIdentity:(id)a3 syncable:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  void *v19;
  id v21;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "publicKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "privateKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v10);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_retainAutorelease(v12);
  v21 = 0;
  v16 = _serializeKeyPairToData(v14, objc_msgSend(v15, "bytes"), &v21);
  v17 = v21;
  if ((_DWORD)v16)
  {
    if (a5)
    {
      HMErrorFromOSStatus(v16);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[HAPSystemKeychainStore saveKeyPair:username:syncable:error:](self, "saveKeyPair:username:syncable:error:", v17, v19, v6, a5);

  }
  return v18;
}

- (BOOL)saveHH2PairingIdentity:(id)a3 syncable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HAPSystemKeychainStore *v24;
  NSObject *v25;
  void *v26;
  BOOL v27;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  objc_msgSend(v6, "publicKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "privateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v9);
  v13 = objc_msgSend(v12, "bytes");
  v14 = objc_retainAutorelease(v11);
  v31 = 0;
  v15 = _serializeKeyPairToData(v13, objc_msgSend(v14, "bytes"), &v31);
  v16 = v31;
  if ((_DWORD)v15)
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v20;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize HH2 key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v7, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[HAPSystemKeychainStore _saveKeyPair:username:syncable:keyType:](self, "_saveKeyPair:username:syncable:keyType:", v16, v22, v4, &unk_1E8989488);

  v17 = (void *)MEMORY[0x1D17B7244]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  v19 = v25;
  if ((_DWORD)v23)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v20;
      v34 = 2112;
      v35 = v26;
      v36 = 2112;
      v37 = v21;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to save HH2 pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    v27 = 0;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v33 = v29;
    v34 = 2112;
    v35 = v30;
    _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully saved HH2 pairing identity %@ to keychain", buf, 0x16u);

  }
  v27 = 1;
LABEL_10:

  objc_autoreleasePoolPop(v17);
  return v27;
}

- (int)_createControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  id v11;
  void *v12;
  void *v13;
  HAPKeychainItem *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  HAPSystemKeychainStore *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HAPSystemKeychainStore *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  HAPSystemKeychainStore *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  HAPSystemKeychainStore *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  HAPSystemKeychainStore *v50;
  void *v51;
  id *v53;
  void *context;
  void *contexta;
  id *v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  _BYTE __s[32];
  _BYTE v65[32];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  cced25519_make_key_pair_compat();
  v57 = 0;
  _serializeKeyPairToData((uint64_t)v65, (uint64_t)__s, &v57);
  v11 = v57;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(HAPKeychainItem);
  -[HAPKeychainItem setAccessGroup:](v14, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  -[HAPKeychainItem setLabel:](v14, "setLabel:", CFSTR("HomeKit Pairing Identity"));
  -[HAPKeychainItem setItemDescription:](v14, "setItemDescription:", CFSTR("Identity used to pair with HomeKit accessories."));
  -[HAPKeychainItem setAccount:](v14, "setAccount:", v13);
  -[HAPKeychainItem setValueData:](v14, "setValueData:", v11);
  if ((deviceSupportsKeychainSync() & 1) != 0)
  {
    -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 1);
    -[HAPKeychainItem setType:](v14, "setType:", &unk_1E8989428);
    -[HAPKeychainItem type](v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __viewHintForKeyType(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setViewHint:](v14, "setViewHint:", v16);

    v17 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v14, 1);
    if ((_DWORD)v17)
    {
      v18 = v17;
      v19 = (void *)MEMORY[0x1D17B7244]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v22;
        v60 = 2112;
        v61 = v13;
        v62 = 2112;
        v63 = v23;
        v24 = "%{public}@Failed to create v3 controller key for username %@ with error: %@";
LABEL_8:
        _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x20u);

        goto LABEL_28;
      }
      goto LABEL_28;
    }
    -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 1);
    -[HAPKeychainItem setType:](v14, "setType:", &unk_1E8989440);
    -[HAPKeychainItem type](v14, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    __viewHintForKeyType(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setViewHint:](v14, "setViewHint:", v30);

    v31 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v14, 1);
    v56 = a5;
    if ((_DWORD)v31)
    {
      v32 = v31;
      context = (void *)MEMORY[0x1D17B7244]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = a6;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v35;
        v60 = 2112;
        v61 = v13;
        v62 = 2112;
        v63 = v36;
        _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to create v2 controller key for username %@ with error: %@", buf, 0x20u);

        a6 = v53;
      }

      objc_autoreleasePoolPop(context);
      a5 = v56;
    }
    -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 1, v53);
    -[HAPKeychainItem setType:](v14, "setType:", &unk_1E8989458);
    -[HAPKeychainItem type](v14, "type");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    __viewHintForKeyType(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setViewHint:](v14, "setViewHint:", v38);

    v39 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v14, 1);
    if ((_DWORD)v39)
    {
      v40 = v39;
      contexta = (void *)MEMORY[0x1D17B7244]();
      v41 = self;
      HMFGetOSLogHandle();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v53 = a4;
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v59 = v43;
        v60 = 2112;
        v61 = v13;
        v62 = 2112;
        v63 = v44;
        _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to create v0 controller key for username %@ with error: %@", buf, 0x20u);

        a4 = v53;
      }

      objc_autoreleasePoolPop(contexta);
      a5 = v56;
    }
LABEL_17:
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v65, 32);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v45;

    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v46;

    }
    if (a6)
      *a6 = objc_retainAutorelease(v13);
    if (a5)
    {
      -[HAPKeychainItem valueData](v14, "valueData");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    -[HAPSystemKeychainStore setActiveControllerIdentifier:](self, "setActiveControllerIdentifier:", v13, v53);
    v47 = (void *)objc_opt_new();
    v48 = (id)objc_msgSend(v47, "backupWithInfo:", 0);

    memset_s(__s, 0x20uLL, 0, 0x20uLL);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "postNotificationName:object:", CFSTR("kControllerKeyPairGeneratedNotification"), self);

    v19 = (void *)MEMORY[0x1D17B7244]();
    v50 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v59 = v51;
      _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Posting controller key creation notification", buf, 0xCu);

    }
    LODWORD(v18) = 0;
    goto LABEL_28;
  }
  -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 0);
  -[HAPKeychainItem setType:](v14, "setType:", &unk_1E8989470);
  -[HAPKeychainItem type](v14, "type");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __viewHintForKeyType(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v14, "setViewHint:", v26);

  v27 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v14, 1);
  if (!(_DWORD)v27)
    goto LABEL_17;
  v18 = v27;
  v19 = (void *)MEMORY[0x1D17B7244]();
  v28 = self;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HMErrorFromOSStatus(v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v59 = v22;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v23;
    v24 = "%{public}@Failed to create syncable controller key for username %@ with error: %@";
    goto LABEL_8;
  }
LABEL_28:

  objc_autoreleasePoolPop(v19);
  return v18;
}

- (BOOL)saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  char v15;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v10 = a3;
  v11 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4793;
  v27 = __Block_byref_object_dispose__4794;
  v28 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__HAPSystemKeychainStore_saveKeyPair_username_syncable_error___block_invoke;
  v17[3] = &unk_1E894B2F0;
  v22 = a5;
  v17[4] = self;
  v13 = v10;
  v18 = v13;
  v14 = v11;
  v19 = v14;
  v20 = &v23;
  v21 = &v29;
  dispatch_sync(v12, v17);

  if (a6)
    *a6 = objc_retainAutorelease((id)v24[5]);
  v15 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (int)_saveKeyPair:(id)a3 username:(id)a4 syncable:(BOOL)a5 keyType:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  HAPKeychainItem *v13;
  void *v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v7 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = objc_alloc_init(HAPKeychainItem);
  -[HAPKeychainItem setAccessGroup:](v13, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  -[HAPKeychainItem setType:](v13, "setType:", v12);
  -[HAPKeychainItem setLabel:](v13, "setLabel:", CFSTR("HomeKit Pairing Identity"));
  -[HAPKeychainItem setItemDescription:](v13, "setItemDescription:", CFSTR("Identity used to pair with HomeKit accessories."));
  -[HAPKeychainItem setSyncable:](v13, "setSyncable:", v7);
  -[HAPKeychainItem setAccount:](v13, "setAccount:", v11);
  -[HAPKeychainItem setValueData:](v13, "setValueData:", v10);
  __viewHintForKeyType(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v13, "setViewHint:", v14);

  v15 = (void *)MEMORY[0x1D17B7244]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v18;
    v23 = 2112;
    v24 = v11;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to save controller key-pair for username %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v19 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](v16, "_addKeychainItem:logDuplicateItemError:", v13, 1);

  return v19;
}

- (BOOL)deserializeKeyPair:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 error:(id *)a6
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _BYTE __s[32];
  _BYTE v15[32];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = _deserializeDataToKeyPair(a3, (uint64_t)v15, (uint64_t)__s);
  v10 = v9;
  if (a4)
  {
    if (!(_DWORD)v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 32);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v11;

      if (!a5)
        goto LABEL_9;
      goto LABEL_8;
    }
    *a4 = 0;
  }
  if (!a5)
    goto LABEL_9;
  if ((_DWORD)v9)
  {
    *a5 = 0;
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a5 = v12;

LABEL_9:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  if (a6)
  {
    HMErrorFromOSStatus(v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return (_DWORD)v10 == 0;
}

- (BOOL)getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5 error:(id *)a6
{
  NSObject *v11;
  char v12;
  _QWORD block[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4793;
  v37 = __Block_byref_object_dispose__4794;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4793;
  v31 = __Block_byref_object_dispose__4794;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4793;
  v25 = __Block_byref_object_dispose__4794;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4793;
  v19 = __Block_byref_object_dispose__4794;
  v20 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HAPSystemKeychainStore_getAllAvailableControllerPublicKeys_secretKeys_userNames_error___block_invoke;
  block[3] = &unk_1E894A1A8;
  block[4] = self;
  block[5] = &v33;
  block[6] = &v27;
  block[7] = &v21;
  block[8] = &v15;
  block[9] = &v39;
  dispatch_sync(v11, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v34[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v28[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v22[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v16[5]);
  v12 = *((_BYTE *)v40 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);
  return v12;
}

- (int)_getAllAvailableControllerPublicKeys:(id *)a3 secretKeys:(id *)a4 userNames:(id *)a5
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  uint64_t v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  int v47;
  int v48;
  _BYTE v49[128];
  _BYTE __s[32];
  _DWORD v51[8];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v7 = deviceSupportsKeychainSync();
  if (v7)
    v8 = &unk_1E8989428;
  else
    v8 = &unk_1E8989470;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v8, 0, 1, &v48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);
  v47 = 0;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), &unk_1E8989440, 0, 1, &v47);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);
  v46 = 0;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), &unk_1E8989458, 0, 1, &v46);
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:");
  if (v7)
  {
    v51[0] = 0;
    -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), &unk_1E8989470, 0, 1, v51);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v11);
    v13 = v47;
    v12 = v48;
    v14 = v46;
    v15 = v51[0];

    if (!v12 || !v13 || !v14 || !v15)
      goto LABEL_14;
LABEL_13:
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = (void *)v39;
    goto LABEL_38;
  }
  v12 = v48;
  if (v48 && v47 && v46)
    goto LABEL_13;
LABEL_14:
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v21 = 0;
    v40 = 0;
  }
  v41 = (id)v21;
  v34 = v10;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v35 = v6;
  v22 = v6;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v23)
  {
    v24 = v23;
    v19 = 0;
    v25 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v43 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v27, "account");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v16, "containsObject:", v28);

        if ((v29 & 1) == 0)
        {
          objc_msgSend(v27, "valueData");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = _deserializeDataToKeyPair(v30, (uint64_t)v51, (uint64_t)__s);

          if (v12)
          {

            v6 = v35;
            v10 = v34;
            v20 = (void *)v39;
            v18 = v40;
            goto LABEL_37;
          }
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v51, 32);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "addObject:", v31);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "addObject:", v19);
          objc_msgSend(v27, "account");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v32);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v24)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }

  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  v18 = v40;
  if (a3)
    *a3 = objc_retainAutorelease(v40);
  v6 = v35;
  v10 = v34;
  v20 = (void *)v39;
  if (a4)
    *a4 = objc_retainAutorelease(v41);
  if (a5)
  {
    v16 = objc_retainAutorelease(v16);
    v12 = 0;
    *a5 = v16;
  }
  else
  {
    v12 = 0;
  }
LABEL_37:
  v17 = v41;
LABEL_38:

  return v12;
}

- (BOOL)updateActiveControllerPairingIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HAPSystemKeychainStore_updateActiveControllerPairingIdentifier___block_invoke;
  block[3] = &unk_1E894BD68;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

- (NSString)activeControllerPairingIdentifier
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4793;
  v11 = __Block_byref_object_dispose__4794;
  v12 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HAPSystemKeychainStore_activeControllerPairingIdentifier__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (BOOL)updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  HAPSystemKeychainStore *v12;
  NSObject *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  BOOL v18;
  NSObject *v19;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _BYTE buf[24];
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v31 = v17;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@-[%@ %@] no-op in ROAR", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    v18 = 1;
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy__4793;
    v32 = __Block_byref_object_dispose__4794;
    v33 = 0;
    -[HAPSystemKeychainStore queue](self, "queue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__HAPSystemKeychainStore_updateCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke;
    block[3] = &unk_1E894BEA8;
    block[4] = self;
    v22 = v9;
    v23 = v10;
    v24 = &v26;
    v25 = buf;
    dispatch_sync(v19, block);

    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v18 = *((_BYTE *)v27 + 24) != 0;

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v18;
}

- (int)_updateCurrentiCloudIdentifier:(id)a3 controllerPairingIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  HAPKeychainItem *v12;
  void *v13;
  void *v14;
  int v16;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216211);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v8, 0, 1, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "count")
    || (objc_msgSend(v9, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", v10, 1), v10, (v11 = v16) == 0))
  {
    v11 = 0;
    if (v6 && v7)
    {
      v12 = objc_alloc_init(HAPKeychainItem);
      -[HAPKeychainItem setAccessGroup:](v12, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216211);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPKeychainItem setType:](v12, "setType:", v13);

      -[HAPKeychainItem setLabel:](v12, "setLabel:", CFSTR("iCloud HomeKit Identifier"));
      -[HAPKeychainItem setItemDescription:](v12, "setItemDescription:", CFSTR("Per-device mapping between the current iCloud account and the HomeKit Pairing Identity."));
      -[HAPKeychainItem setSyncable:](v12, "setSyncable:", 0);
      -[HAPKeychainItem setAccount:](v12, "setAccount:", v6);
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPKeychainItem setValueData:](v12, "setValueData:", v14);

      v11 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v12, 1);
      v16 = v11;

    }
  }

  return v11;
}

- (BOOL)getCurrentiCloudIdentifier:(id *)a3 controllerPairingIdentifier:(id *)a4 error:(id *)a5
{
  NSObject *v9;
  char v10;
  _QWORD block[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__4793;
  v29 = __Block_byref_object_dispose__4794;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4793;
  v23 = __Block_byref_object_dispose__4794;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4793;
  v17 = __Block_byref_object_dispose__4794;
  v18 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__HAPSystemKeychainStore_getCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke;
  block[3] = &unk_1E894A1D0;
  block[4] = self;
  block[5] = &v25;
  block[6] = &v19;
  block[7] = &v13;
  block[8] = &v31;
  dispatch_sync(v9, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v26[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = *((_BYTE *)v32 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v10;
}

- (BOOL)removeControllerKeyPairWithError:(id *)a3
{
  return -[HAPSystemKeychainStore removeControllerKeyPairLeaveTombstone:error:](self, "removeControllerKeyPairLeaveTombstone:error:", 1, a3);
}

- (BOOL)removeControllerKeyPairLeaveTombstone:(BOOL)a3 error:(id *)a4
{
  NSObject *v7;
  char v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4793;
  v16 = __Block_byref_object_dispose__4794;
  v17 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HAPSystemKeychainStore_removeControllerKeyPairLeaveTombstone_error___block_invoke;
  v10[3] = &unk_1E894A1F8;
  v11 = a3;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  dispatch_sync(v7, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v13[5]);
  v8 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (BOOL)removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  HAPSystemKeychainStore *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  id v17;
  __int128 *p_buf;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__4793;
    v28 = __Block_byref_object_dispose__4794;
    v29 = 0;
    -[HAPSystemKeychainStore queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__HAPSystemKeychainStore_removeControllerKeyPairForIdentifier_leaveTombstone_error___block_invoke;
    block[3] = &unk_1E894A220;
    block[4] = self;
    v20 = a4;
    v17 = v8;
    p_buf = &buf;
    v19 = &v21;
    dispatch_sync(v9, block);

    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*((_QWORD *)&buf + 1) + 40));
    v10 = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "%{public}@inIdentifier must be specified", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    if (a5)
    {
      HMErrorFromOSStatus(4294960569);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (int)_removeControllerKeyPairForIdentifier:(id)a3 leaveTombstone:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v4 = a4;
  v6 = a3;
  v7 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989428, v6, v4);
  v8 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989440, v6, v4);
  if (!v7)
    v7 = v8;
  v9 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989458, v6, v4);
  if (!v7)
    v7 = v9;
  v10 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989470, v6, v4);
  if (!v7)
    v7 = v10;
  v11 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989488, v6, v4);
  if (!v7)
    v7 = v11;
  v12 = -[HAPSystemKeychainStore _removeControllerKeyPairForKeyType:identifier:leaveTombstone:](self, "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E89894A0, v6, v4);

  if (v7)
    return v7;
  else
    return v12;
}

- (int)_removeControllerKeyPairForKeyType:(id)a3 identifier:(id)a4 leaveTombstone:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  int v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v25 = 0;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), a3, 0, 1, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v25;
  if (!v25)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v9;
    v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v20 = v10;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (v8)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "account");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", v8);

            if (v18)
            {
              v13 = v16;
              -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", v13, v5);
              goto LABEL_13;
            }
          }
          else
          {
            -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), v5);
          }
        }
        v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
LABEL_13:
      v10 = v20;
    }

    if (!v8 || v13)
    {
      v11 = v25;

    }
    else
    {
      v11 = -6727;
      v25 = -6727;
    }
  }

  return v11;
}

- (id)readPublicKeyForAccessoryName:(id)a3 registeredWithHomeKit:(BOOL *)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4793;
  v28 = __Block_byref_object_dispose__4794;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4793;
  v22 = __Block_byref_object_dispose__4794;
  v23 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__HAPSystemKeychainStore_readPublicKeyForAccessoryName_registeredWithHomeKit_error___block_invoke;
  block[3] = &unk_1E894C4A8;
  block[4] = self;
  v15 = &v24;
  v17 = a4;
  v10 = v8;
  v14 = v10;
  v16 = &v18;
  dispatch_sync(v9, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (id)v25[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

- (int)_getPublicKey:(id *)a3 registeredWithHomeKit:(BOOL *)a4 forAccessoryName:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  HAPSystemKeychainStore *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  HAPSystemKeychainStore *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  BOOL *v38;
  void *v39;
  id *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  int v46;
  char v47[32];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v9, v8, 1, &v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v46;
  if (v46)
  {
    v27 = 0;
    if (!a3)
      goto LABEL_28;
LABEL_25:
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47, 32);
      v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a3 = v36;

      v11 = v46;
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    v38 = a4;
    v40 = a3;
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 138543874;
      v50 = v15;
      v51 = 2048;
      v52 = v16;
      v53 = 2112;
      v54 = v8;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_INFO, "%{public}@Invalid number of keychain items(%tu) for accessory '%@'", buf, 0x20u);

    }
    v41 = v8;

    objc_autoreleasePoolPop(v12);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v39 = v10;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v23 = (void *)MEMORY[0x1D17B7244]();
          v24 = v13;
          HMFGetOSLogHandle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v50 = v26;
            v51 = 2112;
            v52 = v22;
            _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_INFO, "%{public}@Keychain item %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
      }
      while (v19);
    }

    a3 = v40;
    v8 = v41;
    a4 = v38;
    v10 = v39;
  }
  if (objc_msgSend(v10, "count") != 1)
  {
    v27 = 0;
    v11 = -6764;
    v46 = -6764;
    if (!a3)
      goto LABEL_28;
LABEL_26:
    *a3 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v10, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueData");
  v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = objc_msgSend(v28, "bytes");
  objc_msgSend(v27, "valueData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = _deserializePublicKey(v29, objc_msgSend(v30, "length"));

  if (a4)
  {
    objc_msgSend(v27, "genericData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v32 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v27, "genericData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "propertyListWithData:options:format:error:", v33, 0, 0, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_21:
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("homeKitRegistered"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v35 = 0;
        }
        *a4 = objc_msgSend(v35, "BOOLValue");

        goto LABEL_24;
      }

    }
    v34 = 0;
    goto LABEL_21;
  }
LABEL_24:
  v11 = v46;
  if (a3)
    goto LABEL_25;
LABEL_28:

  return v11;
}

- (BOOL)savePublicKey:(id)a3 forAccessoryName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__4793;
  v24 = __Block_byref_object_dispose__4794;
  v25 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__HAPSystemKeychainStore_savePublicKey_forAccessoryName_error___block_invoke;
  block[3] = &unk_1E894BEA8;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v18 = &v20;
  v19 = &v26;
  dispatch_sync(v10, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (int)_savePublicKey:(id)a3 forAccessoryName:(id)a4
{
  id v6;
  HAPKeychainItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v15;
  uint64_t v16;
  _BYTE v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(objc_retainAutorelease(a3), "bytes"))
  {
    DataToHexCStringEx();
    v7 = objc_alloc_init(HAPKeychainItem);
    -[HAPKeychainItem setAccessGroup:](v7, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setType:](v7, "setType:", v8);

    objc_msgSend(CFSTR("Paired HomeKit Accessory"), "stringByAppendingFormat:", CFSTR(": %@"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setLabel:](v7, "setLabel:", v9);

    -[HAPKeychainItem setItemDescription:](v7, "setItemDescription:", CFSTR("HomeKit accessory that has been paired with this account."));
    -[HAPKeychainItem setSyncable:](v7, "setSyncable:", 0);
    -[HAPKeychainItem setAccount:](v7, "setAccount:", v6);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 64);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setValueData:](v7, "setValueData:", v10);

    v15 = CFSTR("homeKitRegistered");
    v16 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setGenericData:](v7, "setGenericData:", v12);

    v13 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v7, 0);
  }
  else
  {
    v13 = -6705;
  }

  return v13;
}

- (BOOL)establishRelationshipBetweenAccessoryAndControllerKey:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v11;
  void *v12;
  void *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFDictionary *Mutable;
  const void *v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  uint64_t v33;
  uint64_t v34;
  HAPSystemKeychainStore *v35;
  NSObject *v36;
  void *v38;
  void *context;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint8_t v44[4];
  void *v45;
  __int16 v46;
  int v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_28;
  }
  v4 = v11;
  objc_msgSend(v11, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_28:
    _HMFPreconditionFailure();
    goto LABEL_29;
  }
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "controllerKeyIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v49 = v16;
      v50 = 2112;
      v51 = v17;
      v52 = 2112;
      v53 = v18;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Establish relationship between Accessory : [%@] & controller key : [%@]", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    objc_msgSend(v4, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](v14, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v5, v19, 1, &v43);
    self = (HAPSystemKeychainStore *)objc_claimAutoreleasedReturnValue();

    if (!self || -[HAPSystemKeychainStore hmf_isEmpty](self, "hmf_isEmpty"))
    {
      v20 = (void *)MEMORY[0x1D17B7244]();
      v21 = v14;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v23;
        v50 = 2112;
        v51 = v24;
        _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "%{public}@Could not locate the accessory keychain item for : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      LOBYTE(v21) = 0;
      goto LABEL_24;
    }
    -[HAPSystemKeychainStore firstObject](self, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_opt_class();
    objc_msgSend(v8, "genericData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "controllerKeyIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateAccessoryPairingGenericData:updatedControllerKeyIdentifier:", v26, v27);
    v21 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v42 = (void *)v21;
    if (objc_msgSend(v7, "bytes"))
    {
      DataToHexCStringEx();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 64);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v41 = v8;
      if (objc_msgSend(v8, "platformReference"))
      {
        v30 = (const void *)objc_msgSend(v8, "platformReference");
        CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E0], v30);
        v31 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v31)
        {
          v32 = v31;
          CFDictionaryAddValue(v31, (const void *)*MEMORY[0x1E0CD70D8], v28);
          CFDictionaryAddValue(v32, (const void *)*MEMORY[0x1E0CD69B0], (const void *)v21);
          v33 = SecItemUpdate(Mutable, v32);
          LOBYTE(v21) = (_DWORD)v33 == 0;
          if ((_DWORD)v33)
          {
            v34 = v33;
            v40 = v28;
            context = (void *)MEMORY[0x1D17B7244]();
            v35 = v14;
            HMFGetOSLogHandle();
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v44 = 138543618;
              v45 = v38;
              v46 = 1024;
              v47 = v34;
              _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to update accessory keychain item : %d", v44, 0x12u);

            }
            objc_autoreleasePoolPop(context);
            v28 = v40;
            if (a4)
            {
              HMErrorFromOSStatus(v34);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          CFRelease(Mutable);
          goto LABEL_22;
        }
      }
      else
      {
        v43 = -6705;
      }
      v32 = Mutable;
LABEL_22:
      CFRelease(v32);

      v8 = v41;
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
LABEL_29:

    if (a4)
    {
      HMErrorFromOSStatus(4294960591);
      LOBYTE(v21) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v21) = 0;
    }
    goto LABEL_23;
  }
  if (a4)
  {
    HMErrorFromOSStatus(4294960591);
    LOBYTE(v21) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v21) = 0;
  }
LABEL_25:

  return v21 & 1;
}

- (BOOL)registerAccessoryWithHomeKit:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  HAPSystemKeychainStore *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4793;
  v20 = __Block_byref_object_dispose__4794;
  v21 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HAPSystemKeychainStore_registerAccessoryWithHomeKit_error___block_invoke;
  v11[3] = &unk_1E894B250;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (BOOL)removeAccessoryKeyForName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  HAPSystemKeychainStore *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4793;
  v20 = __Block_byref_object_dispose__4794;
  v21 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__HAPSystemKeychainStore_removeAccessoryKeyForName_error___block_invoke;
  v11[3] = &unk_1E894B250;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (BOOL)removeAllAccessoryKeys:(id *)a3
{
  NSObject *v5;
  char v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4793;
  v13 = __Block_byref_object_dispose__4794;
  v14 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HAPSystemKeychainStore_removeAllAccessoryKeys___block_invoke;
  block[3] = &unk_1E894B360;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (int)_removeAccessoryKeyForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v5, v4, 1, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v19;
  if (!v19)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), 1, (_QWORD)v15);
          if (v13)
            v19 = v13;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    v7 = v19;
  }

  return v7;
}

- (id)auditKeysOfManagedAccessories:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4793;
  v16 = __Block_byref_object_dispose__4794;
  v17 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HAPSystemKeychainStore_auditKeysOfManagedAccessories___block_invoke;
  block[3] = &unk_1E894BD68;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)_auditKeychainItems:(id)a3 managedAccessories:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  HAPSystemKeychainStore *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  void *v18;
  void *v19;
  HAPKeychainStoreRemovedAccessory *v20;
  void *v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HAPSystemKeychainStore *v27;
  NSObject *v28;
  void *v29;
  HAPKeychainStoreRemovedAccessory *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  HAPSystemKeychainStore *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  id v48;
  __int128 v50;
  void *v51;
  id obj;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v7;
  v54 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = (void *)MEMORY[0x1D17B7244]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v12;
    v69 = 2112;
    v70 = v56;
    _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries for accessories: %@", buf, 0x16u);

  }
  v53 = (void *)v8;

  objc_autoreleasePoolPop(v9);
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  if (!v13)
  {
    v16 = 0;
    goto LABEL_24;
  }
  v15 = v13;
  v16 = 0;
  v55 = *(_QWORD *)v62;
  *(_QWORD *)&v14 = 138543618;
  v50 = v14;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v62 != v55)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
      objc_msgSend(v18, "account", v50);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "containsObject:", v19))
      {
        objc_msgSend(v51, "hmf_dataForKey:", v19);
        v20 = (HAPKeychainStoreRemovedAccessory *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "matchesPublicKeyData:", v20))
        {
          objc_msgSend(v54, "removeObjectForKey:", v19);
          goto LABEL_20;
        }
        v26 = (void *)MEMORY[0x1D17B7244]();
        v27 = v10;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v50;
          v68 = v29;
          v69 = 2112;
          v70 = v19;
          _os_log_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - will remove keychain item for accessory %@ due to data mismatch", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v26);

      }
      else
      {
        v21 = (void *)MEMORY[0x1D17B7244]();
        v22 = v10;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "account");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v50;
          v68 = v24;
          v69 = 2112;
          v70 = v25;
          _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - will remove spurious keychain item - %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v21);
      }
      v30 = [HAPKeychainStoreRemovedAccessory alloc];
      objc_msgSend(v18, "account");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "creationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HAPKeychainStoreRemovedAccessory initWithName:creationDate:](v30, "initWithName:creationDate:", v31, v32);

      v33 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](v10, "_removeKeychainItem:leaveTombstone:", v18, 1);
      v16 = v33;
      if ((_DWORD)v33)
      {
        HMErrorFromOSStatus(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAPKeychainStoreRemovedAccessory setRemoveError:](v20, "setRemoveError:", v34);

      }
      objc_msgSend(v53, "addObject:", v20);
LABEL_20:

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
  }
  while (v15);
LABEL_24:

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v54, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v58;
    while (2)
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v58 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        v41 = (void *)MEMORY[0x1D17B7244]();
        v42 = v10;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v68 = v44;
          v69 = 2112;
          v70 = v40;
          _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_INFO, "%{public}@Auditing keychain entries - adding keychain item for accessory %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v41);
        objc_msgSend(v54, "hmf_dataForKey:", v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[HAPSystemKeychainStore _savePublicKey:forAccessoryName:](v42, "_savePublicKey:forAccessoryName:", v45, v40);

        if (v46)
        {

          goto LABEL_38;
        }
      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v37)
        continue;
      break;
    }

LABEL_36:
    v47 = v53;
    v48 = v53;
  }
  else
  {

    if (!v16)
      goto LABEL_36;
LABEL_38:
    v48 = 0;
    v47 = v53;
  }

  return v48;
}

- (void)_updateKeychainItemToInvisible:(id)a3
{
  id v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  __CFDictionary *Mutable;
  const void *v8;
  __CFDictionary *v9;
  const __CFDictionary *v10;
  OSStatus v11;
  OSStatus v12;
  void *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  const __CFDictionary *v17;
  int v18;
  void *v19;
  __int16 v20;
  OSStatus v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isSyncable")
    && (objc_msgSend(v4, "isInvisible") & 1) == 0
    && objc_msgSend(v4, "platformReference"))
  {
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v8 = (const void *)objc_msgSend(v4, "platformReference");
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E0], v8);
    v9 = CFDictionaryCreateMutable(0, 0, v5, v6);
    if (v9)
    {
      v10 = v9;
      CFDictionaryAddValue(v9, (const void *)*MEMORY[0x1E0CD69C0], (const void *)*MEMORY[0x1E0C9AE50]);
      v11 = SecItemUpdate(Mutable, v10);
      if (v11)
      {
        v12 = v11;
        v13 = (void *)MEMORY[0x1D17B7244]();
        v14 = self;
        HMFGetOSLogHandle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = v16;
          v20 = 1024;
          v21 = v12;
          _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated keychain item to set invisible with error: %d", (uint8_t *)&v18, 0x12u);

        }
        objc_autoreleasePoolPop(v13);
      }
      CFRelease(Mutable);
      v17 = v10;
    }
    else
    {
      v17 = Mutable;
    }
    CFRelease(v17);
  }

}

- (BOOL)_updateKeychainItemWithPlatformIdentifier:(void *)a3 keychainItem:(id)a4 error:(id *)a5
{
  void *Mutable;
  id v8;
  const CFDictionaryKeyCallBacks *v9;
  const CFDictionaryValueCallBacks *v10;
  CFMutableDictionaryRef v11;
  __CFDictionary *v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!objc_msgSend(v8, "platformReference"))
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  objc_msgSend(v8, "valueData");
  Mutable = (void *)objc_claimAutoreleasedReturnValue();

  if (!Mutable)
  {
LABEL_13:
    _HMFPreconditionFailure();
LABEL_14:
    CFRelease(Mutable);
    v16 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v9 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v10 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, (const void *)*MEMORY[0x1E0CD70E0], a3);
  v11 = CFDictionaryCreateMutable(0, 0, v9, v10);
  if (!v11)
    goto LABEL_14;
  v12 = v11;
  v13 = (const void *)*MEMORY[0x1E0CD70D8];
  objc_msgSend(v8, "valueData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryAddValue(v12, v13, v14);

  v15 = SecItemUpdate((CFDictionaryRef)Mutable, v12);
  if ((_DWORD)v15)
  {
    HMErrorFromOSStatus(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1D17B7244]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated keychain item to set invisible with error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }
  else
  {
    v16 = 0;
  }
  CFRelease(Mutable);
  CFRelease(v12);
  if (a5)
LABEL_10:
    *a5 = objc_retainAutorelease(v16);
LABEL_11:

  return v16 == 0;
}

- (id)_getKeychainItemsForAccessGroup:(id)a3 type:(id)a4 account:(id)a5 shouldReturnData:(BOOL)a6 error:(int *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  OSStatus v16;
  HAPKeychainItem *v17;
  __CFDictionary *Mutable;
  const void *v19;
  const void *v20;
  CFTypeID v21;
  CFIndex v22;
  const void *ValueAtIndex;
  HAPKeychainItem *v24;
  void *v25;
  HAPSystemKeychainStore *v26;
  NSObject *v27;
  void *v28;
  CFTypeID v29;
  HAPKeychainItem *v30;
  id v31;
  void *v32;
  HAPSystemKeychainStore *v33;
  NSObject *v34;
  void *v35;
  const char *v36;
  id v38;
  int *v39;
  id v40;
  id v41;
  void *value;
  CFTypeRef result;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v8 = a6;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  __viewHintForKeyType(v13);
  value = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = -6705;
  v17 = 0;
  if (v12 && v13)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], v12);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6BC8], v13);
    if (v14)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v14);
    v19 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
    if (v8)
      v20 = v19;
    else
      v20 = (const void *)*MEMORY[0x1E0C9AE40];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], v20);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0CD6B88]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7020], v19);
    if (value)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B78], value);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6F30], (const void *)*MEMORY[0x1E0CD6F38]);
    result = 0;
    v16 = SecItemCopyMatching(Mutable, &result);
    CFRelease(Mutable);
    if (v16)
    {
      v15 = 0;
      v17 = 0;
      if (!a7)
        goto LABEL_34;
      goto LABEL_33;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = CFGetTypeID(result);
    if (v21 == CFArrayGetTypeID())
    {
      v40 = v12;
      v41 = v14;
      v38 = v13;
      v39 = a7;
      v22 = 0;
      v17 = 0;
      while (CFArrayGetCount((CFArrayRef)result) > v22)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, v22);
        if (+[HAPKeychainItem isQueryResultValid:shouldIncludeData:](HAPKeychainItem, "isQueryResultValid:shouldIncludeData:", ValueAtIndex, v8))
        {
          v24 = -[HAPKeychainItem initWithQueryResult:shouldIncludeData:]([HAPKeychainItem alloc], "initWithQueryResult:shouldIncludeData:", ValueAtIndex, v8);

          objc_msgSend(v15, "addObject:", v24);
          -[HAPSystemKeychainStore _updateKeychainItemToInvisible:](self, "_updateKeychainItemToInvisible:", v24);
          v17 = v24;
        }
        else
        {
          v25 = (void *)MEMORY[0x1D17B7244]();
          v26 = self;
          HMFGetOSLogHandle();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v45 = v28;
            _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Corrupted keychain item detected. Ignoring", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v25);
        }
        ++v22;
      }
      a7 = v39;
      v12 = v40;
      v13 = v38;
      goto LABEL_30;
    }
    v29 = CFGetTypeID(result);
    if (v29 == CFDictionaryGetTypeID())
    {
      if (+[HAPKeychainItem isQueryResultValid:shouldIncludeData:](HAPKeychainItem, "isQueryResultValid:shouldIncludeData:", result, v8))
      {
        v30 = [HAPKeychainItem alloc];
        v17 = -[HAPKeychainItem initWithQueryResult:shouldIncludeData:](v30, "initWithQueryResult:shouldIncludeData:", result, v8);
        objc_msgSend(v15, "addObject:", v17);
        -[HAPSystemKeychainStore _updateKeychainItemToInvisible:](self, "_updateKeychainItemToInvisible:", v17);
LABEL_31:
        CFRelease(result);
        v16 = 0;
        goto LABEL_32;
      }
      v41 = v14;
      v31 = v13;
      v32 = (void *)MEMORY[0x1D17B7244]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v35;
      v36 = "%{public}@Corrupted keychain item detected. Ignoring";
    }
    else
    {
      v41 = v14;
      v31 = v13;
      v32 = (void *)MEMORY[0x1D17B7244]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_29:

        objc_autoreleasePoolPop(v32);
        v17 = 0;
        v13 = v31;
LABEL_30:
        v14 = v41;
        goto LABEL_31;
      }
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v45 = v35;
      v36 = "%{public}@Unexpected type returned from keychain result";
    }
    _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0xCu);

    goto LABEL_29;
  }
LABEL_32:
  if (a7)
LABEL_33:
    *a7 = v16;
LABEL_34:

  return v15;
}

- (int)_addKeychainItem:(id)a3 logDuplicateItemError:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFDictionary *Mutable;
  __CFDictionary *v14;
  const void *v15;
  void *v16;
  const void *v17;
  void *v18;
  const void *v19;
  void *v20;
  const void *v21;
  void *v22;
  const void *v23;
  void *v24;
  const void *v25;
  void *v26;
  void *v27;
  const void *v28;
  void *v29;
  const void *v30;
  void *v31;
  int v32;
  const void *v33;
  const void *v34;
  void *v35;
  const void *v36;
  void *v37;
  OSStatus v38;
  int v39;
  void *v40;
  HAPSystemKeychainStore *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "accessGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_23;
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_23;
  objc_msgSend(v6, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_23;
  objc_msgSend(v6, "itemDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_23;
  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_msgSend(v6, "valueData"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, v12))
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v14 = Mutable;
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
      v15 = (const void *)*MEMORY[0x1E0CD6898];
      objc_msgSend(v6, "accessGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v15, v16);

      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68B8]);
      v17 = (const void *)*MEMORY[0x1E0CD6BC8];
      objc_msgSend(v6, "type");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v17, v18);

      v19 = (const void *)*MEMORY[0x1E0CD6A90];
      objc_msgSend(v6, "label");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v19, v20);

      v21 = (const void *)*MEMORY[0x1E0CD69A0];
      objc_msgSend(v6, "itemDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v21, v22);

      v23 = (const void *)*MEMORY[0x1E0CD68F8];
      objc_msgSend(v6, "account");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v23, v24);

      v25 = (const void *)*MEMORY[0x1E0CD6B58];
      objc_msgSend(v6, "label");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v25, v26);

      objc_msgSend(v6, "genericData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = (const void *)*MEMORY[0x1E0CD69B0];
        objc_msgSend(v6, "genericData");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryAddValue(v14, v28, v29);

      }
      v30 = (const void *)*MEMORY[0x1E0CD70D8];
      objc_msgSend(v6, "valueData");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(v14, v30, v31);

      v32 = objc_msgSend(v6, "isSyncable");
      v33 = (const void *)*MEMORY[0x1E0C9AE50];
      if (v32)
        v34 = (const void *)*MEMORY[0x1E0C9AE50];
      else
        v34 = (const void *)*MEMORY[0x1E0C9AE40];
      CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD6B80], v34);
      if (objc_msgSend(v6, "isSyncable"))
        CFDictionaryAddValue(v14, (const void *)*MEMORY[0x1E0CD69C0], v33);
      objc_msgSend(v6, "viewHint");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        v36 = (const void *)*MEMORY[0x1E0CD6B78];
        objc_msgSend(v6, "viewHint");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryAddValue(v14, v36, v37);

      }
      v38 = SecItemAdd(v14, 0);
      CFRelease(v14);
      if (a4 || (v39 = -25299, v38 != -25299))
      {
        v40 = (void *)MEMORY[0x1D17B7244]();
        v41 = self;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "account");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "viewHint");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 138544130;
          v48 = v43;
          v49 = 2112;
          v50 = v44;
          v51 = 2112;
          v52 = v45;
          v53 = 2048;
          v54 = v38;
          _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_INFO, "%{public}@Adding keychain item for username %@ with viewHint %@ - error %ld", (uint8_t *)&v47, 0x2Au);

        }
        objc_autoreleasePoolPop(v40);
        v39 = v38;
      }
    }
    else
    {
      v39 = -6728;
    }
  }
  else
  {
LABEL_23:
    v39 = -6705;
  }

  return v39;
}

- (int)_removeKeychainItem:(id)a3 leaveTombstone:(BOOL)a4
{
  id v6;
  void *v7;
  const void *v8;
  __CFDictionary *Mutable;
  void *v10;
  HAPSystemKeychainStore *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HAPSystemKeychainStore *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HAPSystemKeychainStore *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "platformReference"))
  {
    v22 = 4294960591;
LABEL_11:
    v23 = (void *)MEMORY[0x1D17B7244]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v26;
      v32 = 2112;
      v33 = v27;
      _os_log_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to delete keychain item with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    goto LABEL_14;
  }
  v8 = (const void *)objc_msgSend(v7, "platformReference");
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E0], v8);
  v10 = (void *)MEMORY[0x1D17B7244]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v29 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "account");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    v36 = 2080;
    v37 = KeyTypeDescription(v16);
    _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Removing keychain item with account  %@(%@) keyType: %s", buf, 0x2Au);

    self = v29;
  }

  objc_autoreleasePoolPop(v10);
  if (objc_msgSend(v7, "isSyncable") && !a4)
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = v11;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Removing syncable keychain item with account %@ and not setting tombstone", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70D0], (const void *)*MEMORY[0x1E0C9AE40]);
  }
  v22 = SecItemDelete(Mutable);
  CFRelease(Mutable);
  if ((_DWORD)v22)
    goto LABEL_11;
LABEL_14:

  return v22;
}

- (BOOL)savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  char v17;
  _QWORD block[5];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v12 = a3;
  v13 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4793;
  v30 = __Block_byref_object_dispose__4794;
  v31 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __112__HAPSystemKeychainStore_savePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke;
  block[3] = &unk_1E894A248;
  block[4] = self;
  v15 = v12;
  v20 = v15;
  v16 = v13;
  v24 = a5;
  v25 = a6;
  v21 = v16;
  v22 = &v32;
  v23 = &v26;
  dispatch_sync(v14, block);

  if (a7)
    *a7 = objc_retainAutorelease((id)v27[5]);
  v17 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v17;
}

- (int)_savePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 resumeSessionID:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  HAPKeychainItem *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v22[0] = CFSTR("BLE HomeKit Accessory Protocol Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("BLE Pair Resume Session ID");
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = 0;
  v24[1] = 0;
  if (v10)
  {
    objc_msgSend(v10, "getUUIDBytes:", v24);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v24, 16);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(HAPKeychainItem);
    -[HAPKeychainItem setAccessGroup:](v16, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216194);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setType:](v16, "setType:", v17);

    objc_msgSend(CFSTR("BTLE HomeKit Accessory Identifier"), "stringByAppendingFormat:", CFSTR(": %@"), v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setLabel:](v16, "setLabel:", v18);

    -[HAPKeychainItem setItemDescription:](v16, "setItemDescription:", CFSTR("Per-device persistent identifier for BTLE accessories that support HomeKit."));
    -[HAPKeychainItem setSyncable:](v16, "setSyncable:", 0);
    -[HAPKeychainItem setAccount:](v16, "setAccount:", v11);
    -[HAPKeychainItem setValueData:](v16, "setValueData:", v15);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setGenericData:](v16, "setGenericData:", v19);

    v20 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v16, 0);
  }
  else
  {
    v20 = -6705;
  }

  return v20;
}

- (BOOL)updatePeripheralIdentifier:(id)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t)a5 previousVersion:(unint64_t *)a6 resumeSessionID:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  char v19;
  _QWORD block[4];
  id v22;
  HAPSystemKeychainStore *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v14 = a3;
  v15 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4793;
  v34 = __Block_byref_object_dispose__4794;
  v35 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__HAPSystemKeychainStore_updatePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_previousVersion_resumeSessionID_error___block_invoke;
  block[3] = &unk_1E894A270;
  v17 = v15;
  v25 = &v30;
  v27 = a6;
  v28 = a5;
  v22 = v17;
  v23 = self;
  v29 = a7;
  v18 = v14;
  v24 = v18;
  v26 = &v36;
  dispatch_sync(v16, block);

  if (a8)
    *a8 = objc_retainAutorelease((id)v31[5]);
  v19 = *((_BYTE *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v19;
}

- (BOOL)deletePeripheralIdentifierForAccessoryIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  HAPSystemKeychainStore *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4793;
  v20 = __Block_byref_object_dispose__4794;
  v21 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HAPSystemKeychainStore_deletePeripheralIdentifierForAccessoryIdentifier_error___block_invoke;
  v11[3] = &unk_1E894B250;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v22;
  dispatch_sync(v7, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

- (int)_deletePeripheralIdentifierForAccessoryIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216194);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v5, v4, 1, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v18;
  if (!v18)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v18 = -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), 1, (_QWORD)v14);
        if (v18)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

    v7 = v18;
  }

  return v7;
}

- (id)readPeripheralIdentifierForAccessoryIdentifier:(id)a3 protocolVersion:(unint64_t *)a4 resumeSessionID:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t *v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v10 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4793;
  v31 = __Block_byref_object_dispose__4794;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__4793;
  v25 = __Block_byref_object_dispose__4794;
  v26 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__HAPSystemKeychainStore_readPeripheralIdentifierForAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke;
  v15[3] = &unk_1E894A298;
  v15[4] = self;
  v17 = &v27;
  v12 = v10;
  v19 = a4;
  v20 = a5;
  v16 = v12;
  v18 = &v21;
  dispatch_sync(v11, v15);

  if (a6)
    *a6 = objc_retainAutorelease((id)v22[5]);
  v13 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (int)_getPeripheralIdentifier:(id *)a3 forAccessoryIdentifier:(id)a4 protocolVersion:(unint64_t *)a5 resumeSessionID:(unint64_t *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v26;
  int v27;

  v27 = 0;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithUnsignedInt:", 1751216194);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v12, v11, 1, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v14 = 0;
    goto LABEL_17;
  }
  if (objc_msgSend(v13, "count") != 1)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v14 = 0;
    v27 = -6764;
    goto LABEL_17;
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v16 = _deserializeUUID(v15, &v26);
  v17 = v26;
  v27 = v16;

  if (v27)
  {
    v18 = 0;
    v19 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v14, "genericData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v20 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v14, "genericData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "propertyListWithData:options:format:error:", v21, 0, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v18 = 0;
    }
  }
  if (!a5)
  {
    v19 = 0;
    if (!a6)
      goto LABEL_17;
    goto LABEL_14;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BLE HomeKit Accessory Protocol Version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v19 = 0;
  }
  *a5 = objc_msgSend(v19, "integerValue");
  if (a6)
  {
LABEL_14:
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("BLE Pair Resume Session ID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v22 = 0;
    }
    *a6 = objc_msgSend(v22, "longLongValue");

  }
LABEL_17:
  v23 = v27;
  if (a3)
  {
    if (v27)
      v24 = 0;
    else
      v24 = v17;
    *a3 = objc_retainAutorelease(v24);
    v23 = v27;
  }

  return v23;
}

- (id)getPeripheralIdentifiersAndAccessoryNames
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__4793;
  v14 = __Block_byref_object_dispose__4794;
  v15 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HAPSystemKeychainStore_getPeripheralIdentifiersAndAccessoryNames__block_invoke;
  v9[3] = &unk_1E894DEE8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(v3, v9);

  v4 = (void *)v11[5];
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

    v4 = (void *)v11[5];
  }
  v7 = v4;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)deleteAllPeripheralIdentifiers:(id *)a3
{
  NSObject *v5;
  char v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__4793;
  v13 = __Block_byref_object_dispose__4794;
  v14 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HAPSystemKeychainStore_deleteAllPeripheralIdentifiers___block_invoke;
  block[3] = &unk_1E894B360;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (int)_deleteAllPeripheralIdentifiers
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216194);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v3, 0, 1, &v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v16;
  if (!v16)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[HAPSystemKeychainStore _removeKeychainItem:leaveTombstone:](self, "_removeKeychainItem:leaveTombstone:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), 1, (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v8);
    }

    v5 = v16;
  }

  return v5;
}

- (id)readControllerPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HAPPairingIdentity *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HAPSystemKeychainStore *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  void *context;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = 0;
  v29 = 0;
  v26 = 0;
  v27 = 0;
  v6 = -[HAPSystemKeychainStore _getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:](self, "_getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:", &v29, &v28, 0, &v27, 0, v5, &v26);
  v7 = v29;
  v8 = v28;
  v9 = v27;
  v10 = v26;
  if (v6)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v7);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v8);
    v13 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:permissions:", v9, v11, v12, 0);
    if (!v13)
    {
      context = (void *)MEMORY[0x1D17B7244]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v23;
        v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity with username, %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to retrieve pairing identity for accessory : %@"), v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hapErrorWithCode:description:reason:suggestion:underlyingError:", 1, v17, CFSTR("did not find pairing identity in keychain"), 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v18 = (void *)MEMORY[0x1D17B7244]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      v32 = 2112;
      v33 = v5;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to get the accessory pairing key for accessory : %@ : %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v10);
  }

  return v13;
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 username:(id *)a5 allowCreation:(BOOL)a6 forAccessory:(id)a7 error:(id *)a8
{
  return -[HAPSystemKeychainStore _getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:](self, "_getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:", a3, a4, 0, a5, a6, a7, a8);
}

- (BOOL)getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9
{
  return -[HAPSystemKeychainStore _getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:](self, "_getControllerPublicKey:secretKey:keyPair:username:allowCreation:forAccessory:error:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)_getControllerPublicKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6 allowCreation:(BOOL)a7 forAccessory:(id)a8 error:(id *)a9
{
  _BOOL8 v9;
  id v14;
  _BOOL8 v15;
  id *v16;
  void *v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  id *v20;
  void *v21;
  char v22;
  _BOOL8 v23;
  id *v24;
  void *v25;
  HAPSystemKeychainStore *v26;
  NSObject *v27;
  id *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  id v38;
  void *v39;
  BOOL v40;
  void *v41;
  HAPSystemKeychainStore *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  HAPSystemKeychainStore *v53;
  NSObject *v54;
  void *v55;
  id *v56;
  void *v57;
  HAPSystemKeychainStore *v58;
  NSObject *v59;
  id *v60;
  void *v61;
  id *v62;
  void *v63;
  HAPSystemKeychainStore *v64;
  NSObject *v65;
  id *v66;
  void *v67;
  void *v68;
  HAPSystemKeychainStore *v69;
  NSObject *v70;
  id *v71;
  void *v72;
  id *v74;
  id *v75;
  id *v76;
  void *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  id *v81;
  id v82;
  void *v84;
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  int v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v9 = a7;
  v98 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  if (v14)
  {
    if (-[HAPSystemKeychainStore _getPublicKey:registeredWithHomeKit:forAccessoryName:](self, "_getPublicKey:registeredWithHomeKit:forAccessoryName:", 0, 0, v14))
    {
      v15 = v9;
      v16 = a3;
      v17 = (void *)MEMORY[0x1D17B7244]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = a4;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v93 = v21;
        v94 = 2112;
        v95 = (uint64_t)v14;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_INFO, "%{public}@Couldn't find the controller key for the given accessory [%@]. Returning default controller key.", buf, 0x16u);

        a4 = v20;
      }

      objc_autoreleasePoolPop(v17);
      v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v18, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v16, a4, a5, a6, v15, a9);
    }
    else
    {
      v90 = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v30, v14, 1, &v90);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = v9;
      v81 = a5;
      if (v31 && objc_msgSend(v31, "count") == 1)
      {
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_opt_class();
        objc_msgSend(v32, "genericData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "getDictionaryFromGenericData:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v35, "hmf_stringForKey:", CFSTR("ctrlKeyId"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            v85 = 0;
            v37 = -[HAPSystemKeychainStore _getFirstAvailableControllerKeyChainItemForAccount:publicKey:secretKey:userName:keyPair:error:](self, "_getFirstAvailableControllerKeyChainItemForAccount:publicKey:secretKey:userName:keyPair:error:", v36, a3, a4, a6, v81, &v85);
            v38 = v85;
            v39 = v38;
            if (a9)
              *a9 = objc_retainAutorelease(v38);
            if (v39)
              v40 = 0;
            else
              v40 = v37;
            if (v40)
            {
              v22 = 1;
            }
            else
            {
              v84 = v36;
              v76 = a3;
              v68 = (void *)MEMORY[0x1D17B7244]();
              v69 = self;
              HMFGetOSLogHandle();
              v70 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v71 = a4;
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v93 = v72;
                v94 = 2112;
                v95 = (uint64_t)v84;
                v96 = 2112;
                v97 = v39;
                _os_log_impl(&dword_1CCE01000, v70, OS_LOG_TYPE_ERROR, "%{public}@No controller keys exist for HAPAccessory : %@: [error : %@]", buf, 0x20u);

                a4 = v71;
              }

              objc_autoreleasePoolPop(v68);
              v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v69, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v76, a4, v81, a6, v80, a9);
              v36 = v84;
            }

          }
          else
          {
            v79 = v31;
            v62 = a3;
            v63 = (void *)MEMORY[0x1D17B7244]();
            v64 = self;
            HMFGetOSLogHandle();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v66 = a4;
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v93 = v67;
              v94 = 2112;
              v95 = (uint64_t)v14;
              _os_log_impl(&dword_1CCE01000, v65, OS_LOG_TYPE_INFO, "%{public}@Generic dictionary does not exist for the given accessory identifier [%@]. Returning default controller key", buf, 0x16u);

              a4 = v66;
            }

            objc_autoreleasePoolPop(v63);
            v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v64, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v62, a4, v81, a6, v80, a9);
            v31 = v79;
            v36 = 0;
          }

        }
        else
        {
          v78 = v31;
          v56 = a3;
          v57 = (void *)MEMORY[0x1D17B7244]();
          v58 = self;
          HMFGetOSLogHandle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v60 = a4;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v93 = v61;
            v94 = 2112;
            v95 = (uint64_t)v14;
            _os_log_impl(&dword_1CCE01000, v59, OS_LOG_TYPE_INFO, "%{public}@Generic data for the accessory does not exist for accessory identifier [%@]. Returning default controller key", buf, 0x16u);

            a4 = v60;
          }

          objc_autoreleasePoolPop(v57);
          v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v58, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v56, a4, v81, a6, v80, a9);
          v31 = v78;
        }

      }
      else
      {
        v75 = a3;
        v74 = a4;
        v41 = (void *)MEMORY[0x1D17B7244]();
        v42 = self;
        HMFGetOSLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v31, "count");
          *(_DWORD *)buf = 138543874;
          v93 = v44;
          v94 = 2048;
          v95 = v45;
          v96 = 2112;
          v97 = v14;
          _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_INFO, "%{public}@Invalid number of keychain items(%tu) for accessory '%@'", buf, 0x20u);

        }
        v82 = v14;

        objc_autoreleasePoolPop(v41);
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v77 = v31;
        v46 = v31;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v48; ++i)
            {
              if (*(_QWORD *)v87 != v49)
                objc_enumerationMutation(v46);
              v51 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
              v52 = (void *)MEMORY[0x1D17B7244]();
              v53 = v42;
              HMFGetOSLogHandle();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v93 = v55;
                v94 = 2112;
                v95 = v51;
                _os_log_impl(&dword_1CCE01000, v54, OS_LOG_TYPE_INFO, "%{public}@Keychain item %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v52);
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v86, v91, 16);
          }
          while (v48);
        }

        v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v42, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v75, v74, v81, a6, v80, a9);
        v14 = v82;
        v31 = v77;
      }

    }
  }
  else
  {
    v23 = v9;
    v24 = a3;
    v25 = (void *)MEMORY[0x1D17B7244]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = a4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v93 = v29;
      _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_ERROR, "%{public}@Accessory Identifier is nil. Cannot retrieve controller key for the given accessory. Returning default controller key.", buf, 0xCu);

      a4 = v28;
    }

    objc_autoreleasePoolPop(v25);
    v22 = -[HAPSystemKeychainStore getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:](v26, "getControllerPublicKey:secretKey:keyPair:username:allowCreation:error:", v24, a4, a5, a6, v23, a9);
    v14 = 0;
  }

  return v22;
}

- (BOOL)_getFirstAvailableControllerKeyChainItemForAccount:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 userName:(id *)a6 keyPair:(id *)a7 error:(id *)a8
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  HAPSystemKeychainStore *v29;
  NSObject *v30;
  void *v31;
  id *v32;
  id v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  HAPSystemKeychainStore *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id *v44;
  id *v45;
  id *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  void *v58;
  uint8_t __s[32];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v48 = a8;
  v44 = a4;
  v45 = a5;
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    objc_msgSend(&unk_1E8989B10, "arrayByAddingObjectsFromArray:", &unk_1E8989AF8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = &unk_1E8989AF8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1D17B7244]();
        *(_DWORD *)buf = 0;
        -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v20, v12, 1, buf);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (*(_DWORD *)buf)
          v24 = 1;
        else
          v24 = v22 == 0;
        if (!v24)
        {
          objc_msgSend(v14, "addObjectsFromArray:", v22);

          objc_autoreleasePoolPop(v21);
          goto LABEL_16;
        }

        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
    }
    while (v17);
  }
LABEL_16:

  objc_msgSend(v14, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(0, "account");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", v12);

    if (v27)
    {
      v28 = (void *)MEMORY[0x1D17B7244]();
      v29 = self;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v31;
        v62 = 2112;
        v63 = v12;
        _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find the controller key for given account identifier : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
      v32 = v48;
      if (!v48)
      {
        v34 = 0;
        goto LABEL_37;
      }
      HMErrorFromOSStatus(4294960569);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      goto LABEL_27;
    }
  }
  objc_msgSend(v25, "valueData");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = _deserializeDataToKeyPair(v35, (uint64_t)buf, (uint64_t)__s);

  v34 = (_DWORD)v36 == 0;
  if ((_DWORD)v36)
  {
    v37 = v14;
    v38 = (void *)MEMORY[0x1D17B7244]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v53 = 138543874;
      v54 = v41;
      v55 = 2112;
      v56 = v12;
      v57 = 2112;
      v58 = v42;
      _os_log_impl(&dword_1CCE01000, v40, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize the key for account : %@, Encountered error: %@", v53, 0x20u);

    }
    objc_autoreleasePoolPop(v38);
    v14 = v37;
    v32 = v48;
    v34 = 0;
    if (v48)
    {
      HMErrorFromOSStatus(v36);
      v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      *v32 = v33;
    }
  }
  else
  {
    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
      *v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v45)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
      *v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a6)
    {
      objc_msgSend(v25, "account");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a7)
    {
      objc_msgSend(v25, "valueData");
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
  }
LABEL_37:

  return v34;
}

- (id)allKeychainItemsForType:(id)a3 identifier:(id)a4 syncable:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__4793;
  v43 = __Block_byref_object_dispose__4794;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__4793;
  v37 = __Block_byref_object_dispose__4794;
  v38 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke;
  block[3] = &unk_1E894BEA8;
  v31 = &v39;
  block[4] = self;
  v15 = v10;
  v29 = v15;
  v16 = v11;
  v30 = v16;
  v32 = &v33;
  dispatch_sync(v13, block);

  if (a6)
    *a6 = objc_retainAutorelease((id)v34[5]);
  if (v34[5])
  {
    v17 = (void *)MEMORY[0x1D17B7244]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v15, "unsignedIntegerValue");
      v22 = v34[5];
      *(_DWORD *)buf = 138543874;
      v46 = v20;
      v47 = 2048;
      v48 = v21;
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to query keychain items for group %lu: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v23 = 0;
  }
  else
  {
    v24 = (void *)v40[5];
    if (v12)
    {
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke_256;
      v26[3] = &unk_1E894A2E0;
      v27 = v12;
      objc_msgSend(v24, "na_filter:", v26);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = v24;
    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v23;
}

- (BOOL)deleteKeychainItem:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  HAPSystemKeychainStore *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4793;
  v23 = __Block_byref_object_dispose__4794;
  v24 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HAPSystemKeychainStore_deleteKeychainItem_error___block_invoke;
  block[3] = &unk_1E894BD68;
  block[4] = self;
  v8 = v6;
  v17 = v8;
  v18 = &v19;
  dispatch_sync(v7, block);

  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  if (v20[5])
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v20[5];
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove keychain item %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v14 = v20[5] == 0;
  }
  else
  {
    v14 = 1;
  }

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (BOOL)updateKeychainItem:(id)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  id v8;
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
  char v20;
  NSObject *v21;
  id v22;
  char v23;
  _Unwind_Exception *v25;
  _QWORD block[5];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  v8 = a3;
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCreationDate:", v11);

    objc_msgSend(v9, "viewHint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v8, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      __viewHintForKeyType(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setViewHint:", v14);

    }
  }
  objc_msgSend(v9, "accessGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  objc_msgSend(v9, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_13:
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  objc_msgSend(v9, "account");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  objc_msgSend(v9, "creationDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_15:
    _HMFPreconditionFailure();
LABEL_16:
    v25 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);
    _Unwind_Resume(v25);
  }
  objc_msgSend(v9, "accessGroup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqual:", CFSTR("com.apple.hap.pairing"));

  if ((v20 & 1) == 0)
    goto LABEL_16;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__4793;
  v35 = __Block_byref_object_dispose__4794;
  v36 = 0;
  -[HAPSystemKeychainStore queue](self, "queue");
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke;
  block[3] = &unk_1E894A220;
  block[4] = self;
  v22 = v9;
  v30 = a4;
  v27 = v22;
  v28 = &v31;
  v29 = &v37;
  dispatch_sync(v21, block);

  if (a5)
    *a5 = objc_retainAutorelease((id)v32[5]);
  v23 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v23;
}

- (id)readAccessoryPairingKeyForAccessory:(id)a3 error:(id *)a4
{
  id *v4;
  void *v5;
  void *v6;
  HAPPairingIdentity *v7;
  void *v8;
  HAPPairingIdentity *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v13 = 0;
  if (a4)
    v4 = a4;
  else
    v4 = (id *)&v13;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E8989428, a3, MEMORY[0x1E0C9AAA0], v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v9 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v5, "count"))
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 2;
LABEL_11:
    objc_msgSend(v10, "hmfErrorWithCode:", v11);
    v9 = 0;
    *v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v6, "count") != 1)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = 15;
    goto LABEL_11;
  }
  v7 = [HAPPairingIdentity alloc];
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HAPPairingIdentity initWithKeychainItem:](v7, "initWithKeychainItem:", v8);

LABEL_12:
  return v9;
}

- (BOOL)updateAccessoryPairingKey:(id)a3 error:(id *)a4
{
  id v6;
  HAPMutableKeychainItem *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[HAPMutableKeychainItem initWithPairingIdentity:]([HAPMutableKeychainItem alloc], "initWithPairingIdentity:", v6);

  -[HAPKeychainItem setAccessGroup:](v7, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  -[HAPKeychainItem setType:](v7, "setType:", &unk_1E8989428);
  -[HAPKeychainItem type](v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPSystemKeychainStore viewHintForType:](HAPSystemKeychainStore, "viewHintForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v7, "setViewHint:", v9);

  LOBYTE(a4) = -[HAPSystemKeychainStore updateKeychainItem:createIfNeeded:error:](self, "updateKeychainItem:createIfNeeded:error:", v7, 0, a4);
  return (char)a4;
}

- (BOOL)createAccessoryPairingKey:(id)a3 error:(id *)a4
{
  id v6;
  HAPMutableKeychainItem *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = -[HAPMutableKeychainItem initWithPairingIdentity:]([HAPMutableKeychainItem alloc], "initWithPairingIdentity:", v6);

  -[HAPKeychainItem setAccessGroup:](v7, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  -[HAPKeychainItem setType:](v7, "setType:", &unk_1E8989428);
  -[HAPKeychainItem type](v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPSystemKeychainStore viewHintForType:](HAPSystemKeychainStore, "viewHintForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v7, "setViewHint:", v9);

  -[HAPKeychainItem setItemDescription:](v7, "setItemDescription:", CFSTR("HomeKit accessory that has been paired with this account."));
  -[HAPKeychainItem setLabel:](v7, "setLabel:", CFSTR("Paired HomeKit Accessory"));
  LOBYTE(a4) = -[HAPSystemKeychainStore updateKeychainItem:createIfNeeded:error:](self, "updateKeychainItem:createIfNeeded:error:", v7, 0, a4);

  return (char)a4;
}

- (BOOL)deletePairingKeysForAccessory:(id)a3 error:(id *)a4
{
  id v6;
  HAPMutableKeychainItem *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(HAPMutableKeychainItem);
  -[HAPKeychainItem setAccessGroup:](v7, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
  -[HAPKeychainItem setType:](v7, "setType:", &unk_1E8989428);
  -[HAPKeychainItem type](v7, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HAPSystemKeychainStore viewHintForType:](HAPSystemKeychainStore, "viewHintForType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainItem setViewHint:](v7, "setViewHint:", v9);

  -[HAPKeychainItem setAccount:](v7, "setAccount:", v6);
  LOBYTE(a4) = -[HAPSystemKeychainStore deleteKeychainItem:error:](self, "deleteKeychainItem:error:", v7, a4);

  return (char)a4;
}

- (BOOL)isAccessoryAssociatedWithControllerKey:(id)a3 controllerID:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPSystemKeychainStore *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", v8, v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && !objc_msgSend(v9, "hmf_isEmpty"))
  {
    if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error : Multiple entries found for accessory : %@. Using the first one", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __78__HAPSystemKeychainStore_isAccessoryAssociatedWithControllerKey_controllerID___block_invoke;
      v26[3] = &unk_1E894A330;
      v26[4] = v16;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v26);
    }
    objc_msgSend(v9, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_class();
    objc_msgSend(v19, "genericData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getDictionaryFromGenericData:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("ctrlKeyId"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v14 = v23 != 0;
      if (a4 && v23)
        *a4 = objc_retainAutorelease(v23);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v13;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@No keychain entries found for accessory : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

- (id)allKeysForType:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void *v23;

  v6 = (void *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", v7, 0, MEMORY[0x1E0C9AAB0], &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke;
  v21[3] = &unk_1E894A330;
  v11 = v8;
  v22 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v21);
  v20 = 0;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", v7, 0, MEMORY[0x1E0C9AAA0], &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke_2;
  v18[3] = &unk_1E894A330;
  v13 = v11;
  v19 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);
  if (a4)
  {
    if (v23)
      v14 = v23;
    else
      v14 = v20;
    *a4 = objc_retainAutorelease(v14);
  }
  v15 = v19;
  v16 = v13;

  return v16;
}

- (id)allHH2PairingKeys
{
  return -[HAPSystemKeychainStore allKeysForType:error:](self, "allKeysForType:error:", &unk_1E8989488, 0);
}

- (id)_allAccessoryPairingKeysIncludingHH2Key:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17B7244]();
  if (v3)
  {
    objc_msgSend(&unk_1E8989B40, "arrayByAddingObjectsFromArray:", &unk_1E8989B28);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &unk_1E8989B28;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke;
  v10[3] = &unk_1E894A380;
  v10[4] = self;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)countAccessoryPairingKeysForMetrics
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  HAPSystemKeychainStore *v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1D17B7244]();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__HAPSystemKeychainStore_countAccessoryPairingKeysForMetrics__block_invoke;
  v11 = &unk_1E894A380;
  v12 = self;
  v5 = v3;
  v13 = v5;
  objc_msgSend(&unk_1E8989B58, "enumerateObjectsUsingBlock:", &v8);

  objc_autoreleasePoolPop(v4);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11, v12);

  return v6;
}

- (id)allAccessoryPairingKeys
{
  return -[HAPSystemKeychainStore _allAccessoryPairingKeysIncludingHH2Key:](self, "_allAccessoryPairingKeysIncludingHH2Key:", -[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"));
}

- (id)allLegacyAccessoryPairingKeys
{
  return -[HAPSystemKeychainStore _allAccessoryPairingKeysIncludingHH2Key:](self, "_allAccessoryPairingKeysIncludingHH2Key:", 0);
}

- (BOOL)triggerPreferredHH2ControllerKeyRoll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  HAPSystemKeychainStore *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HAPSystemKeychainStore getPreferredHH2ControllerKey](self, "getPreferredHH2ControllerKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
    do
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "compare:", v7);

    }
    while (v8 == 1);
    v9 = -[HAPSystemKeychainStore createHH2ControllerKeyWithUsername:publicKey:secretKey:keyPair:username:](self, "createHH2ControllerKeyWithUsername:publicKey:secretKey:keyPair:username:", v4, 0, 0, 0, 0) == 0;

  }
  else
  {
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to trigger preferred hh2 controller key roll due to no existing HH2 controller key", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (int)createHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = -[HAPSystemKeychainStore createHH2ControllerKeyWithUsername:publicKey:secretKey:keyPair:username:](self, "createHH2ControllerKeyWithUsername:publicKey:secretKey:keyPair:username:", v12, a3, a4, a5, a6);

  return (int)a6;
}

- (int)createHH2ControllerKeyWithUsername:(id)a3 publicKey:(id *)a4 secretKey:(id *)a5 keyPair:(id *)a6 username:(id *)a7
{
  id v12;
  id v13;
  HAPKeychainItem *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HAPSystemKeychainStore *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  HAPSystemKeychainStore *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id *v41;
  id v42;
  void *context;
  id *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE __s[32];
  _BYTE v53[32];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    cced25519_make_key_pair_compat();
    v45 = 0;
    _serializeKeyPairToData((uint64_t)v53, (uint64_t)__s, &v45);
    v13 = v45;
    v14 = objc_alloc_init(HAPKeychainItem);
    -[HAPKeychainItem setAccessGroup:](v14, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
    -[HAPKeychainItem setLabel:](v14, "setLabel:", CFSTR("HomeKit Pairing Identity"));
    -[HAPKeychainItem setItemDescription:](v14, "setItemDescription:", CFSTR("Identity used to pair with HomeKit accessories."));
    -[HAPKeychainItem setAccount:](v14, "setAccount:", v12);
    -[HAPKeychainItem setValueData:](v14, "setValueData:", v13);
    -[HAPKeychainItem setSyncable:](v14, "setSyncable:", 1);
    -[HAPKeychainItem setType:](v14, "setType:", &unk_1E8989488);
    -[HAPKeychainItem type](v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __viewHintForKeyType(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setViewHint:](v14, "setViewHint:", v16);

    v17 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](self, "_addKeychainItem:logDuplicateItemError:", v14, 1);
    if ((_DWORD)v17)
    {
      v44 = a7;
      context = (void *)MEMORY[0x1D17B7244]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = v13;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v17);
        v41 = a6;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v47 = v20;
        v48 = 2112;
        v49 = v12;
        v50 = 2112;
        v51 = v21;
        _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create HH2 controller key for username %@ with error: %@", buf, 0x20u);

        a6 = v41;
        v13 = v42;
      }

      objc_autoreleasePoolPop(context);
      a7 = v44;
      if (a4)
        *a4 = 0;
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v53, 32);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v22;

    }
    if (a5)
    {
      if (!(_DWORD)v17)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
        v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v30;

        if (!a7)
          goto LABEL_18;
        goto LABEL_14;
      }
      *a5 = 0;
    }
    if (!a7)
      goto LABEL_18;
LABEL_14:
    if ((_DWORD)v17)
      v23 = 0;
    else
      v23 = v12;
    *a7 = objc_retainAutorelease(v23);
LABEL_18:
    if (a6)
    {
      if ((_DWORD)v17)
      {
        *a6 = 0;
LABEL_22:
        v24 = (void *)MEMORY[0x1D17B7244]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = v13;
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          HMErrorFromOSStatus(v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v47 = v28;
          v48 = 2112;
          v49 = v29;
          _os_log_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%{public}@Could not create HH2 controller key : %@", buf, 0x16u);

          v13 = v27;
        }

        objc_autoreleasePoolPop(v24);
LABEL_31:
        memset_s(__s, 0x20uLL, 0, 0x20uLL);

        goto LABEL_32;
      }
      -[HAPKeychainItem valueData](v14, "valueData");
      v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v31;

    }
    else if ((_DWORD)v17)
    {
      goto LABEL_22;
    }
    v32 = v13;
    -[HAPSystemKeychainStore _savePairingIdentityToBackUpTableWithIdentifier:serializedKeyPair:](self, "_savePairingIdentityToBackUpTableWithIdentifier:serializedKeyPair:", v12, v13);
    v33 = (void *)MEMORY[0x1D17B7244]();
    v34 = self;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = v36;
      v48 = 2112;
      v49 = v37;
      _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_INFO, "%{public}@Saving the HH2 key as back up key : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v33);
    v38 = (void *)objc_opt_new();
    v39 = (id)objc_msgSend(v38, "backupWithInfo:", 0);

    v13 = v32;
    goto LABEL_31;
  }
  LODWORD(v17) = -6705;
LABEL_32:

  return v17;
}

- (BOOL)getOrCreateHH2ControllerKey:(id *)a3 secretKey:(id *)a4 keyPair:(id *)a5 username:(id *)a6
{
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HAPSystemKeychainStore *v20;
  NSObject *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  uint8_t __s[32];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    v32 = 0;
    -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E8989488, 0, MEMORY[0x1E0C9AAB0], &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    v13 = v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 0;
    if (!v14)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the HH2 pairing key. Creating a new HH2 pairing key.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      if (-[HAPSystemKeychainStore createHH2ControllerKey:secretKey:keyPair:username:](v16, "createHH2ControllerKey:secretKey:keyPair:username:", a3, a4, a5, a6))
      {
        v19 = (void *)MEMORY[0x1D17B7244]();
        v20 = v16;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v35 = v22;
          _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to get or create HH2 pairing key.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v19);
        v23 = 0;
        goto LABEL_31;
      }
LABEL_30:
      v23 = 1;
LABEL_31:

      return v23;
    }
    -[HAPSystemKeychainStore _chooseHH2KeyFromMultipleHH2Keys:](self, "_chooseHH2KeyFromMultipleHH2Keys:", v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = _deserializeDataToKeyPair(v25, (uint64_t)buf, (uint64_t)__s);

    if (a3)
    {
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a3 = v27;

        if (!a4)
          goto LABEL_21;
        goto LABEL_20;
      }
      *a3 = 0;
    }
    if (!a4)
      goto LABEL_21;
    if (v26)
    {
      *a4 = 0;
      goto LABEL_21;
    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v28;

LABEL_21:
    if (a5)
    {
      if (!v26)
      {
        objc_msgSend(v24, "valueData");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v29;

        if (!a6)
          goto LABEL_29;
        goto LABEL_28;
      }
      *a5 = 0;
    }
    if (!a6)
    {
LABEL_29:
      memset_s(__s, 0x20uLL, 0, 0x20uLL);

      goto LABEL_30;
    }
    if (v26)
    {
      *a6 = 0;
      goto LABEL_29;
    }
LABEL_28:
    objc_msgSend(v24, "account");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a6 = v30;

    goto LABEL_29;
  }
  return 0;
}

- (id)getHH2ControllerKeyWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HAPSystemKeychainStore *v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    v27 = 0;
    -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E8989488, 0, MEMORY[0x1E0C9AAB0], &v27);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v27;
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __60__HAPSystemKeychainStore_getHH2ControllerKeyWithIdentifier___block_invoke;
    v25 = &unk_1E894A2E0;
    v7 = v4;
    v26 = v7;
    objc_msgSend(v5, "na_firstObjectPassingTest:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HAPSystemKeychainStore pairingIdentityFromKeychainItem:](self, "pairingIdentityFromKeychainItem:", v11, v22, v23, v24, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1D17B7244](0, v8, v9, v10);
      v14 = self;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v29 = v16;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v6;
        _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HH2 controller key with identifier: %@ with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      -[HAPSystemKeychainStore _lookupPairingIdentityFromBackUpTableWithIdentifier:](v14, "_lookupPairingIdentityFromBackUpTableWithIdentifier:", v7, v22, v23, v24, v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v17 = (void *)MEMORY[0x1D17B7244]();
        v18 = v14;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v29 = v20;
          v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Detected HH2 key loss. Looks like we found the key from our back up list. Going to restore it by saving it as hmk2 type : %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        -[HAPSystemKeychainStore saveHH2PairingIdentity:syncable:](v18, "saveHH2PairingIdentity:syncable:", v12, 1);
      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)getPreferredHH2ControllerKey
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  HAPSystemKeychainStore *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
    return 0;
  v13 = 0;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E8989488, 0, MEMORY[0x1E0C9AAB0], &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3 && (objc_msgSend(v3, "count") ? (v5 = v4 == 0) : (v5 = 0), v5))
  {
    -[HAPSystemKeychainStore _chooseHH2KeyFromMultipleHH2Keys:](self, "_chooseHH2KeyFromMultipleHH2Keys:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPSystemKeychainStore pairingIdentityFromKeychainItem:](self, "pairingIdentityFromKeychainItem:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v9;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the HH2 pairing key.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = 0;
  }

  return v10;
}

- (BOOL)_savePairingIdentityToBackUpTableWithIdentifier:(id)a3 serializedKeyPair:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HAPSystemKeychainStore *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  HAPKeychainItem *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  HAPSystemKeychainStore *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B7244]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 && v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v12;
      v28 = 2112;
      v29 = v6;

    }
    objc_autoreleasePoolPop(v8);
    v13 = objc_alloc_init(HAPKeychainItem);
    -[HAPKeychainItem setAccessGroup:](v13, "setAccessGroup:", CFSTR("com.apple.hap.pairing"));
    -[HAPKeychainItem setLabel:](v13, "setLabel:", CFSTR("HomeKit Pairing Identity Backup"));
    -[HAPKeychainItem setItemDescription:](v13, "setItemDescription:", CFSTR("Backup of identity used to pair with HomeKit accessories."));
    -[HAPKeychainItem setAccount:](v13, "setAccount:", v6);
    -[HAPKeychainItem setValueData:](v13, "setValueData:", v7);
    -[HAPKeychainItem setSyncable:](v13, "setSyncable:", 0);
    -[HAPKeychainItem setType:](v13, "setType:", &unk_1E89894D0);
    -[HAPKeychainItem type](v13, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __viewHintForKeyType(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAPKeychainItem setViewHint:](v13, "setViewHint:", v15);

    v16 = -[HAPSystemKeychainStore _addKeychainItem:logDuplicateItemError:](v9, "_addKeychainItem:logDuplicateItemError:", v13, 1);
    v17 = (_DWORD)v16 == 0;
    if ((_DWORD)v16)
    {
      v18 = v16;
      v19 = (void *)MEMORY[0x1D17B7244]();
      v20 = v9;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v22;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = v23;

      }
      objc_autoreleasePoolPop(v19);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v24;
      v28 = 2112;
      v29 = v6;
      v30 = 2112;
      v31 = v7;

    }
    objc_autoreleasePoolPop(v8);
    v17 = 0;
  }

  return v17;
}

- (BOOL)savePairingIdentityToBackUpTable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "privateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_retainAutorelease(v7);
    v11 = objc_msgSend(v10, "bytes");
    v12 = objc_retainAutorelease(v9);
    v27 = 0;
    v13 = _serializeKeyPairToData(v11, objc_msgSend(v12, "bytes"), &v27);
    v14 = v27;
    if ((_DWORD)v13)
    {
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        HMErrorFromOSStatus(v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2112;
        v31 = v19;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize pairing identity key pair to data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      v20 = 0;
    }
    else
    {
      objc_msgSend(v5, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HAPSystemKeychainStore _savePairingIdentityToBackUpTableWithIdentifier:serializedKeyPair:](self, "_savePairingIdentityToBackUpTableWithIdentifier:serializedKeyPair:", v25, v14);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B7244]();
    v22 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v24;

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (id)_lookupPairingIdentityFromBackUpTableWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HAPSystemKeychainStore *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAPSystemKeychainStore allKeysForType:error:](self, "allKeysForType:error:", &unk_1E89894D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v9;
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Was asked to look pairing key with identifier [%@] from the back up list: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__HAPSystemKeychainStore__lookupPairingIdentityFromBackUpTableWithIdentifier___block_invoke;
  v13[3] = &unk_1E894A3A8;
  v14 = v4;
  v10 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)pairingIdentityFromKeychainItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  HAPSystemKeychainStore *v8;
  NSObject *v9;
  void *v10;
  HAPPairingIdentity *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HAPPairingIdentity *v19;
  void *v20;
  void *v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  _BYTE __s[32];
  _BYTE v29[32];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "valueData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _deserializeDataToKeyPair(v5, (uint64_t)v29, (uint64_t)__s);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v10;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get pairing identity from keychain item due to unable to deserialize data", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    v11 = 0;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0D28658]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v29, 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithPairingKeyData:", v13);

    v15 = objc_alloc(MEMORY[0x1E0D28658]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithPairingKeyData:", v16);

    v18 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
    if (v14 && v17)
    {
      v19 = [HAPPairingIdentity alloc];
      objc_msgSend(v4, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:permissions:](v19, "initWithIdentifier:publicKey:privateKey:permissions:", v20, v14, v17, 0);

    }
    else
    {
      v21 = (void *)MEMORY[0x1D17B7244](v18);
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543362;
        v27 = v24;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get pairing identity from keychain item due to unable to initialize public or private key out of deserialized key pair", (uint8_t *)&v26, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)isHH2KeyType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HAPSystemKeychainStore *v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  HAPSystemKeychainStore *v16;
  void *v17;
  int v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  if (-[HAPSystemKeychainStore isHH2Enabled](self, "isHH2Enabled"))
  {
    v6 = (void *)MEMORY[0x1D17B7244]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1752001330);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](self, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v7, v5, 0, &v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "hmf_isEmpty"))
    {
      v10 = (void *)MEMORY[0x1D17B7244]();
      v16 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v14 = 1;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] is HH2 key type", buf, 0x16u);

      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1D17B7244]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2112;
        v22 = v5;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@[%@] is not HH2 key type", buf, 0x16u);

      }
      v14 = 0;
    }

    objc_autoreleasePoolPop(v10);
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)getAssociatedControllerKeyForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HAPSystemKeychainStore *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HAPSystemKeychainStore *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HAPPairingIdentity *v18;
  void *v19;
  HAPSystemKeychainStore *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  HAPSystemKeychainStore *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  HAPSystemKeychainStore *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  HAPSystemKeychainStore *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  HAPSystemKeychainStore *v45;
  NSObject *v46;
  void *v47;
  id v49;
  void *context;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  unsigned int v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7244]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v62 = v9;
    v63 = 2112;
    v64 = v5;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%{public}@Looking for associated controller key for accessory : [%@]", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  -[HAPSystemKeychainStore _getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:](v7, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v10, v5, 1, &v60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && !objc_msgSend(v11, "hmf_isEmpty"))
  {
    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      v19 = (void *)MEMORY[0x1D17B7244]();
      v20 = v7;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v22;
        v63 = 2112;
        v64 = v12;
        _os_log_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_INFO, "%{public}@Warning: Multiple associated key exist : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
    }
    objc_msgSend(v12, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_opt_class();
    objc_msgSend(v23, "genericData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "getDictionaryFromGenericData:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v26, "hmf_stringForKey:", CFSTR("ctrlKeyId"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v58 = 0;
        v59 = 0;
        v56 = 0;
        v57 = 0;
        v28 = -[HAPSystemKeychainStore _getFirstAvailableControllerKeyChainItemForAccount:publicKey:secretKey:userName:keyPair:error:](v7, "_getFirstAvailableControllerKeyChainItemForAccount:publicKey:secretKey:userName:keyPair:error:", v27, &v59, &v58, &v57, 0, &v56);
        v29 = v59;
        v30 = v58;
        v54 = v57;
        v31 = v56;
        v53 = v30;
        v55 = v31;
        if (!v28 || v31)
        {
          v44 = (void *)MEMORY[0x1D17B7244]();
          v45 = v7;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v52 = v44;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v62 = v47;
            v63 = 2112;
            v64 = v27;
            v65 = 2112;
            v66 = v5;
            v67 = 2112;
            v68 = v55;
            _os_log_impl(&dword_1CCE01000, v46, OS_LOG_TYPE_ERROR, "%{public}@No controller key exist for accessory : [Looking for controller key : %@] [accessory : %@] : [error : %@]", buf, 0x2Au);

            v44 = v52;
          }

          objc_autoreleasePoolPop(v44);
          v18 = 0;
        }
        else
        {
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v29);
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28658]), "initWithPairingKeyData:", v30);
          context = (void *)MEMORY[0x1D17B7244]();
          v33 = v7;
          HMFGetOSLogHandle();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v49 = v29;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v62 = v35;
            v63 = 2112;
            v64 = v54;
            v65 = 2112;
            v66 = v5;
            _os_log_impl(&dword_1CCE01000, v34, OS_LOG_TYPE_INFO, "%{public}@Found [%@] for accessory : [%@]", buf, 0x20u);

            v29 = v49;
          }

          objc_autoreleasePoolPop(context);
          v18 = -[HAPPairingIdentity initWithIdentifier:publicKey:privateKey:]([HAPPairingIdentity alloc], "initWithIdentifier:publicKey:privateKey:", v27, v51, v32);

        }
      }
      else
      {
        v40 = (void *)MEMORY[0x1D17B7244]();
        v41 = v7;
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v62 = v43;
          v63 = 2112;
          v64 = v5;
          _os_log_impl(&dword_1CCE01000, v42, OS_LOG_TYPE_INFO, "%{public}@Generic dictionary does not contain the association key for accessory identifier [%@]", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v40);
        v18 = 0;
      }

    }
    else
    {
      v36 = (void *)MEMORY[0x1D17B7244]();
      v37 = v7;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v39;
        v63 = 2112;
        v64 = v5;
        _os_log_impl(&dword_1CCE01000, v38, OS_LOG_TYPE_INFO, "%{public}@Generic data for the accessory does not exist for accessory identifier [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      v18 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B7244]();
    v14 = v7;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v60);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = v16;
      v63 = 2112;
      v64 = v5;
      v65 = 2112;
      v66 = v17;
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_INFO, "%{public}@Could not locate the accessory keychain item for : %@, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = 0;
  }

  return v18;
}

- (BOOL)saveAppleMediaAccessoryPairingIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(v4, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "privateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_retainAutorelease(v9);
  v29 = 0;
  v13 = _serializeKeyPairToData(v11, objc_msgSend(v12, "bytes"), &v29);
  v14 = v29;
  if ((_DWORD)v13)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize apple media pairing key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HAPSystemKeychainStore _saveKeyPair:username:syncable:keyType:](self, "_saveKeyPair:username:syncable:keyType:", v14, v20, 0, &unk_1E89894E8);

  v15 = (void *)MEMORY[0x1D17B7244]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if ((_DWORD)v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to save apple media accessory pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v27;
    v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully saved pairing identity for apple media accessory %@ to keychain", buf, 0x16u);

  }
LABEL_10:

  objc_autoreleasePoolPop(v15);
  return v25;
}

- (id)pairingIdentityForAppleMediaAccessoryWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  HAPSystemKeychainStore *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPSystemKeychainStore *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  HAPSystemKeychainStore *v35;
  NSObject *v36;
  void *v37;
  id v39;
  uint8_t v40[4];
  void *v41;
  uint8_t __s[32];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E89894E8, 0, MEMORY[0x1E0C9AAA0], &v39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v17;
        v45 = 2112;
        v46 = v5;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Found multiple Identities for AMA. Returning the first one: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    objc_msgSend(v5, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _deserializeDataToKeyPair(v19, (uint64_t)buf, (uint64_t)__s);

    if (v20)
    {
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v40 = 138543362;
        v41 = v24;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize AMA key-pair", v40, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v13 = 0;
    }
    else
    {
      v25 = objc_alloc(MEMORY[0x1E0D28658]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithPairingKeyData:", v26);

      v28 = objc_alloc(MEMORY[0x1E0D28658]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithPairingKeyData:", v29);

      v31 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
      if (v27 && v30)
      {
        v32 = objc_alloc(MEMORY[0x1E0D28650]);
        objc_msgSend(v18, "account");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v32, "initWithIdentifier:publicKey:privateKey:", v33, v27, v30);

      }
      else
      {
        v34 = (void *)MEMORY[0x1D17B7244](v31);
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v40 = 138543362;
          v41 = v37;
          _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize public or private key out of deserialized key pair", v40, 0xCu);

        }
        objc_autoreleasePoolPop(v34);
        v13 = 0;
      }

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v12;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the pairing identity for AMA : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

- (BOOL)saveAppleMediaAccessorySensorPairingIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  HAPSystemKeychainStore *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  BOOL v25;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(v4, "publicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "privateKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "bytes");
  v12 = objc_retainAutorelease(v9);
  v29 = 0;
  v13 = _serializeKeyPairToData(v11, objc_msgSend(v12, "bytes"), &v29);
  v14 = v29;
  if ((_DWORD)v13)
  {
    v15 = (void *)MEMORY[0x1D17B7244]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v18;
      v32 = 2112;
      v33 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to serialize apple media sensor pairing key pair to data: %@", buf, 0x16u);
LABEL_8:

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HAPSystemKeychainStore _saveKeyPair:username:syncable:keyType:](self, "_saveKeyPair:username:syncable:keyType:", v14, v20, 0, &unk_1E8989500);

  v15 = (void *)MEMORY[0x1D17B7244]();
  v22 = self;
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if ((_DWORD)v21)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v18;
      v32 = 2112;
      v33 = v24;
      v34 = 2112;
      v35 = v19;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to save apple media sensor accessory pairing identity %@ : %@", buf, 0x20u);

      goto LABEL_8;
    }
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  v25 = 1;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v27;
    v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully saved pairing identity for apple media sensor accessory %@ to keychain", buf, 0x16u);

  }
LABEL_10:

  objc_autoreleasePoolPop(v15);
  return v25;
}

- (id)pairingIdentityForAppleMediaAccessorySensorWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  HAPSystemKeychainStore *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HAPSystemKeychainStore *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  HAPSystemKeychainStore *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  HAPSystemKeychainStore *v35;
  NSObject *v36;
  void *v37;
  id v39;
  uint8_t v40[4];
  void *v41;
  uint8_t __s[32];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39 = 0;
  -[HAPSystemKeychainStore allKeychainItemsForType:identifier:syncable:error:](self, "allKeychainItemsForType:identifier:syncable:error:", &unk_1E8989500, 0, MEMORY[0x1E0C9AAA0], &v39);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v39;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v14 = (void *)MEMORY[0x1D17B7244]();
      v15 = self;
      HMFGetOSLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v17;
        v45 = 2112;
        v46 = v5;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%{public}@Found multiple Identities for AMAS. Returning the first one: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
    }
    objc_msgSend(v5, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "valueData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _deserializeDataToKeyPair(v19, (uint64_t)buf, (uint64_t)__s);

    if (v20)
    {
      v21 = (void *)MEMORY[0x1D17B7244]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v40 = 138543362;
        v41 = v24;
        _os_log_impl(&dword_1CCE01000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to deserialize AMAS key-pair", v40, 0xCu);

      }
      objc_autoreleasePoolPop(v21);
      v13 = 0;
    }
    else
    {
      v25 = objc_alloc(MEMORY[0x1E0D28658]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", buf, 32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithPairingKeyData:", v26);

      v28 = objc_alloc(MEMORY[0x1E0D28658]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", __s, 32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithPairingKeyData:", v29);

      v31 = memset_s(__s, 0x20uLL, 0, 0x20uLL);
      if (v27 && v30)
      {
        v32 = objc_alloc(MEMORY[0x1E0D28650]);
        objc_msgSend(v18, "account");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v32, "initWithIdentifier:publicKey:privateKey:", v33, v27, v30);

      }
      else
      {
        v34 = (void *)MEMORY[0x1D17B7244](v31);
        v35 = self;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v40 = 138543362;
          v41 = v37;
          _os_log_impl(&dword_1CCE01000, v36, OS_LOG_TYPE_ERROR, "%{public}@Unable to initialize public or private key out of deserialized amas key pair", v40, 0xCu);

        }
        objc_autoreleasePoolPop(v34);
        v13 = 0;
      }

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v44 = v12;
      v45 = 2112;
      v46 = v4;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Did not find the pairing identity for AMAS : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = 0;
  }

  return v13;
}

- (id)_chooseHH2KeyFromMultipleHH2Keys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HAPSystemKeychainStore *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_296);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1D17B7244]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Chosen HH2 Key : %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v9);

  }
  return v8;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)activeControllerIdentifier
{
  return self->_activeControllerIdentifier;
}

- (void)setActiveControllerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeControllerIdentifier, a3);
}

- (int)keychainStoreUpdatedNotificationToken
{
  return self->_keychainStoreUpdatedNotificationToken;
}

- (void)setKeychainStoreUpdatedNotificationToken:(int)a3
{
  self->_keychainStoreUpdatedNotificationToken = a3;
}

- (BOOL)unitTest_enable_hh2
{
  return self->_unitTest_enable_hh2;
}

- (void)setUnitTest_enable_hh2:(BOOL)a3
{
  self->_unitTest_enable_hh2 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeControllerIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __59__HAPSystemKeychainStore__chooseHH2KeyFromMultipleHH2Keys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __78__HAPSystemKeychainStore__lookupPairingIdentityFromBackUpTableWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFEqualObjects();

  return v3;
}

uint64_t __60__HAPSystemKeychainStore_getHH2ControllerKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __61__HAPSystemKeychainStore_countAccessoryPairingKeysForMetrics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v9 = 0;
  v4 = a2;
  objc_msgSend(v3, "allKeysForType:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v4);

}

void __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v14 = 0;
  objc_msgSend(v4, "allKeysForType:error:", v3, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (objc_msgSend(v5, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke_276;
    v12[3] = &unk_1E894A358;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17B7244]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = KeyTypeDescription(v3);
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2080;
      v18 = v11;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Error while retrieving all identifies for keyType : %s, error: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __66__HAPSystemKeychainStore__allAccessoryPairingKeysIncludingHH2Key___block_invoke_276(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HAPPairingIdentity *v4;
  char v5;
  HAPPairingIdentity *v6;

  v3 = a2;
  v6 = -[HAPPairingIdentity initWithKeychainItem:]([HAPPairingIdentity alloc], "initWithKeychainItem:", v3);

  v4 = v6;
  if (v6)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

void __47__HAPSystemKeychainStore_allKeysForType_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  HAPPairingIdentity *v4;
  char v5;
  HAPPairingIdentity *v6;

  v3 = a2;
  v6 = -[HAPPairingIdentity initWithKeychainItem:]([HAPPairingIdentity alloc], "initWithKeychainItem:", v3);

  v4 = v6;
  if (v6)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      v4 = v6;
    }
  }

}

void __78__HAPSystemKeychainStore_isAccessoryAssociatedWithControllerKey_controllerID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17B7244]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%{public}@%@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id obj;
  _QWORD v29[4];
  id v30;
  _BYTE *v31;
  __int128 v32;
  unsigned int v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  _BYTE v36[20];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v2 = (id *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "accessGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", v4, v5, v6, 1, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33 == -25300)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "_addKeychainItem:logDuplicateItemError:", *(_QWORD *)(a1 + 40), 0);
      v33 = v8;
      if ((_DWORD)v8)
      {
        HMErrorFromOSStatus(v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = v9;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      }
    }
    else
    {
      v33 = 0;
    }
  }
  else if (objc_msgSend(v7, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v35 = __Block_byref_object_copy__4793;
    *(_QWORD *)v36 = __Block_byref_object_dispose__4794;
    *(_QWORD *)&v36[8] = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke_2;
    v29[3] = &unk_1E894A308;
    v30 = *(id *)(a1 + 40);
    v31 = buf;
    v32 = *(_OWORD *)(a1 + 48);
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v23 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v23)
      {
        v24 = *(void **)(a1 + 32);
        v25 = objc_msgSend(v23, "platformReference");
        v26 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v27 + 40);
        LOBYTE(v24) = objc_msgSend(v24, "_updateKeychainItemWithPlatformIdentifier:keychainItem:error:", v25, v26, &obj);
        objc_storeStrong((id *)(v27 + 40), obj);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v24;
      }

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1D17B7244]();
    v13 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "type");
      v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "account");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMErrorFromOSStatus(v33);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v35 = v17;
      *(_WORD *)v36 = 2112;
      *(_QWORD *)&v36[2] = v18;
      *(_WORD *)&v36[10] = 2112;
      *(_QWORD *)&v36[12] = v19;
      _os_log_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to get keychain items for access group %@, type %@, and account %@ due to error %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v12);
    HMErrorFromOSStatus(v33);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

void __66__HAPSystemKeychainStore_updateKeychainItem_createIfNeeded_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isSyncable") && objc_msgSend(v13, "isSyncable"))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 15);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }

}

void __51__HAPSystemKeychainStore_deleteKeychainItem_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeKeychainItem:leaveTombstone:", *(_QWORD *)(a1 + 40), 1);
  if ((_DWORD)v2)
  {
    HMErrorFromOSStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;

  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, &v8);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (v8)
  {
    HMErrorFromOSStatus(v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

uint64_t __76__HAPSystemKeychainStore_allKeychainItemsForType_identifier_syncable_error___block_invoke_256(uint64_t a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "isSyncable");
  return v3 ^ objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1;
}

void __57__HAPSystemKeychainStore_deleteAllPeripheralIdentifiers___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_deleteAllPeripheralIdentifiers");
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v2, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v3);
  if (v2)

}

void __67__HAPSystemKeychainStore_getPeripheralIdentifiersAndAccessoryNames__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216194);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v3, 0, 1, &v30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v9)
    {
      v10 = v9;
      v24 = v4;
      v11 = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          objc_msgSend(v15, "valueData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v14;
          v17 = _deserializeUUID(v16, &v25);
          v11 = v25;

          v30 = v17;
          if (v30)
          {
            v18 = (void *)MEMORY[0x1D17B7244]();
            v19 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v32 = v21;
              _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%{public}@### Unable to deserialize UUID from keychain item", buf, 0xCu);

            }
            objc_autoreleasePoolPop(v18);
          }
          else
          {
            v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
            objc_msgSend(v15, "account");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v11, v23);

          }
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v10);

      v4 = v24;
    }

  }
}

void __111__HAPSystemKeychainStore_readPeripheralIdentifierForAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v2 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_getPeripheralIdentifier:forAccessoryIdentifier:protocolVersion:resumeSessionID:", &obj, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  objc_storeStrong((id *)(v2 + 40), obj);
  HMErrorFromOSStatus(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __81__HAPSystemKeychainStore_deletePeripheralIdentifierForAccessoryIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!*(_QWORD *)(a1 + 32))
  {
    v2 = 4294960591;
    goto LABEL_5;
  }
  v2 = objc_msgSend(*(id *)(a1 + 40), "_deletePeripheralIdentifierForAccessoryIdentifier:");
  if ((_DWORD)v2)
  {
LABEL_5:
    HMErrorFromOSStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v3 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_6:
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __130__HAPSystemKeychainStore_updatePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_previousVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 40), "_getPeripheralIdentifier:forAccessoryIdentifier:protocolVersion:resumeSessionID:", 0);
      **(_QWORD **)(a1 + 72) = *(_QWORD *)(a1 + 80);
      v2 = *(_QWORD *)(a1 + 32);
    }
    v3 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 40), "_deletePeripheralIdentifierForAccessoryIdentifier:", v2));
    v4 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 88);
      v16 = 138543874;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      v20 = 2048;
      v21 = v8;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%{public}@Updating peripheral [%@] keychain with resumeSessionID: %llu", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v3);
    v9 = objc_msgSend(*(id *)(a1 + 40), "_savePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:resumeSessionID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    if ((_DWORD)v9)
    {
      HMErrorFromOSStatus(v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v10;

  }
  else
  {
    HMErrorFromOSStatus(4294960591);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

void __112__HAPSystemKeychainStore_savePeripheralIdentifier_forAccessoryIdentifier_protocolVersion_resumeSessionID_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_savePeripheralIdentifier:forAccessoryIdentifier:protocolVersion:resumeSessionID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  if ((_DWORD)v2)
  {
    HMErrorFromOSStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __56__HAPSystemKeychainStore_auditKeysOfManagedAccessories___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;

  v9 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216193);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v3, 0, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v5 = v9 == -25300;
  else
    v5 = 1;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_auditKeychainItems:managedAccessories:", v4, *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void __49__HAPSystemKeychainStore_removeAllAccessoryKeys___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeAccessoryKeyForName:", 0);
  if ((_DWORD)v2 == -25300
    || (v3 = v2,
        HMErrorFromOSStatus(v2),
        v4 = objc_claimAutoreleasedReturnValue(),
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v6 = *(void **)(v5 + 40),
        *(_QWORD *)(v5 + 40) = v4,
        v6,
        !v3))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __58__HAPSystemKeychainStore_removeAccessoryKeyForName_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "_removeAccessoryKeyForName:");
    v3 = v2;
    HMErrorFromOSStatus(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    HMErrorFromOSStatus(4294960591);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void __61__HAPSystemKeychainStore_registerAccessoryWithHomeKit_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v22 = 0;
    v2 = *(void **)(a1 + 40);
    v21 = 0;
    v3 = objc_msgSend(v2, "_getPublicKey:registeredWithHomeKit:forAccessoryName:", &v21, &v22);
    v4 = v21;
    if ((_DWORD)v3)
    {
      HMErrorFromOSStatus(v3);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    else if (!v22)
    {
      objc_msgSend(*(id *)(a1 + 40), "_removeAccessoryKeyForName:", *(_QWORD *)(a1 + 32));
      v11 = objc_msgSend(*(id *)(a1 + 40), "_savePublicKey:forAccessoryName:", v4, *(_QWORD *)(a1 + 32));
      v12 = v11;
      HMErrorFromOSStatus(v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (v12 != -25299)
      {
        if (v12)
        {
          v16 = (void *)MEMORY[0x1D17B7244]();
          v17 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            v24 = v19;
            v25 = 2112;
            v26 = v4;
            v27 = 2112;
            v28 = v20;
            v29 = 2048;
            v30 = v12;
            _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize public key '%@' for accessory %@ - error %ld", buf, 0x2Au);

          }
          objc_autoreleasePoolPop(v16);
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        }
      }
    }

  }
  else
  {
    HMErrorFromOSStatus(4294960591);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __63__HAPSystemKeychainStore_savePublicKey_forAccessoryName_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_savePublicKey:forAccessoryName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = v2;
  HMErrorFromOSStatus(v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (v3 != -25299)
  {
    if (v3)
    {
      v7 = (void *)MEMORY[0x1D17B7244]();
      v8 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 48);
        v13 = 138544130;
        v14 = v10;
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v12;
        v19 = 2048;
        v20 = v3;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to serialize public key '%@' for accessory %@ - error %ld", (uint8_t *)&v13, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
}

void __84__HAPSystemKeychainStore_readPublicKeyForAccessoryName_registeredWithHomeKit_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v2 + 40);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_getPublicKey:registeredWithHomeKit:forAccessoryName:", &obj, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(v2 + 40), obj);
  HMErrorFromOSStatus(v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __84__HAPSystemKeychainStore_removeControllerKeyPairForIdentifier_leaveTombstone_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeControllerKeyPairForIdentifier:leaveTombstone:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));
  v3 = v2;
  HMErrorFromOSStatus(v2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeControllerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if (v8)
    {
      v9 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "setActiveControllerIdentifier:", 0));
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(a1 + 40);
        v14 = 138543618;
        v15 = v12;
        v16 = 2112;
        v17 = v13;
        _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%{public}@Removed controller key %@ and set active controller identifier to nil", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __70__HAPSystemKeychainStore_removeControllerKeyPairLeaveTombstone_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removeControllerKeyPairForIdentifier:leaveTombstone:", 0, *(unsigned __int8 *)(a1 + 56));
  if ((_DWORD)v2 == -25300)
  {
    objc_msgSend(*(id *)(a1 + 32), "setActiveControllerIdentifier:", 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = v2;
    HMErrorFromOSStatus(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!v3)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "setActiveControllerIdentifier:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v8 = (void *)MEMORY[0x1D17B7244](v7);
      v9 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "%{public}@Removed controller keys and set active controller identifier to nil", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
    }
  }
}

void __87__HAPSystemKeychainStore_getCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;

  v18 = 0;
  v2 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1751216211);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getKeychainItemsForAccessGroup:type:account:shouldReturnData:error:", CFSTR("com.apple.hap.pairing"), v3, 0, 1, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v18;
  if (!v18)
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "account");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1[5] + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v6, "valueData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithData:encoding:", v11, 4);
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      v5 = v18;
    }
    else
    {
      v5 = 4294960532;
      v18 = -6764;
    }
  }
  HMErrorFromOSStatus(v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(a1[7] + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (!v18)
    *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 1;

}

void __90__HAPSystemKeychainStore_updateCurrentiCloudIdentifier_controllerPairingIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_updateCurrentiCloudIdentifier:controllerPairingIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)v2)
  {
    HMErrorFromOSStatus(v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __59__HAPSystemKeychainStore_activeControllerPairingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "activeControllerIdentifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__HAPSystemKeychainStore_updateActiveControllerPairingIdentifier___block_invoke(uint64_t a1)
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
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeControllerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1D17B7244]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      v17 = 138543618;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%{public}@Controller pairing identifier is already set to: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "activeControllerIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v10 = (void *)MEMORY[0x1D17B7244]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "activeControllerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 1024;
      v24 = v16;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%{public}@Active controller identifier is changing from %@ to %@, marking it as change: %d", (uint8_t *)&v17, 0x26u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "setActiveControllerIdentifier:", *(_QWORD *)(a1 + 40));
  }
}

void __89__HAPSystemKeychainStore_getAllAvailableControllerPublicKeys_secretKeys_userNames_error___block_invoke(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id obj;

  v3 = a1 + 4;
  v2 = (void *)a1[4];
  v4 = *(_QWORD *)(v3[1] + 8);
  v5 = *(void **)(v4 + 40);
  v6 = a1[7];
  v7 = *(_QWORD *)(a1[6] + 8);
  v14 = *(id *)(v7 + 40);
  obj = v5;
  v8 = *(_QWORD *)(v6 + 8);
  v13 = *(id *)(v8 + 40);
  v9 = objc_msgSend(v2, "_getAllAvailableControllerPublicKeys:secretKeys:userNames:", &obj, &v14, &v13);
  objc_storeStrong((id *)(v4 + 40), obj);
  objc_storeStrong((id *)(v7 + 40), v14);
  objc_storeStrong((id *)(v8 + 40), v13);
  HMErrorFromOSStatus(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[8] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (!(_DWORD)v9)
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
}

void __62__HAPSystemKeychainStore_saveKeyPair_username_syncable_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!deviceSupportsKeychainSync())
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 72))
  {
LABEL_7:
    v7 = &unk_1E8989470;
    v6 = 0;
    goto LABEL_8;
  }
  v5 = objc_msgSend(v2, "_saveKeyPair:username:syncable:keyType:", v3, v4, 1, &unk_1E8989428);
  if ((_DWORD)v5)
    goto LABEL_9;
  v5 = objc_msgSend(*(id *)(a1 + 32), "_saveKeyPair:username:syncable:keyType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), &unk_1E8989440);
  if ((_DWORD)v5)
    goto LABEL_9;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(unsigned __int8 *)(a1 + 72);
  v7 = &unk_1E8989458;
LABEL_8:
  v5 = objc_msgSend(v2, "_saveKeyPair:username:syncable:keyType:", v3, v4, v6, v7);
LABEL_9:
  HMErrorFromOSStatus(v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!(_DWORD)v5)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
}

void __96__HAPSystemKeychainStore_getControllerPublicKey_secretKey_keyPair_username_allowCreation_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v28 = *(id *)(v6 + 40);
  obj = v4;
  v7 = *(_QWORD *)(v5 + 8);
  v8 = *(void **)(v7 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v26 = *(id *)(v9 + 40);
  v27 = v8;
  v10 = objc_msgSend(v2, "_getControllerPublicKey:secretKey:keyPair:username:", &obj, &v28, &v27, &v26);
  objc_storeStrong((id *)(v3 + 40), obj);
  objc_storeStrong((id *)(v6 + 40), v28);
  objc_storeStrong((id *)(v7 + 40), v27);
  objc_storeStrong((id *)(v9 + 40), v26);
  if ((_DWORD)v10 != -25293 && (_DWORD)v10 && *(_BYTE *)(a1 + 88))
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(id *)(v15 + 40);
    v25 = v13;
    v16 = *(_QWORD *)(v14 + 8);
    v17 = *(void **)(v16 + 40);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(id *)(v18 + 40);
    v23 = v17;
    v10 = objc_msgSend(v11, "_createControllerPublicKey:secretKey:keyPair:username:", &v25, &v24, &v23, &v22);
    objc_storeStrong((id *)(v12 + 40), v25);
    objc_storeStrong((id *)(v15 + 40), v24);
    objc_storeStrong((id *)(v16 + 40), v23);
    objc_storeStrong((id *)(v18 + 40), v22);
  }
  HMErrorFromOSStatus(v10);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  if (!(_DWORD)v10)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
}

void __62__HAPSystemKeychainStore_ensureControllerKeyExistsForAllViews__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v46 = 0;
  objc_msgSend(*(id *)(a1 + 32), "_getControllerKeychainItemError:", &v46);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v46)
    v4 = 1;
  else
    v4 = v2 == 0;
  if (!v4)
  {
    v5 = deviceSupportsKeychainSync();
    objc_msgSend(v3, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    if (!v5)
    {
      if (v7 != 1752001641)
      {
        objc_msgSend(v3, "valueData");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "account");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989440, v24, 1);
        v25 = (void *)MEMORY[0x1D17B7244](objc_msgSend(*(id *)(a1 + 32), "_removeControllerKeyPairForKeyType:identifier:leaveTombstone:", &unk_1E8989458, v24, 1));
        v26 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v48 = v28;
          _os_log_impl(&dword_1CCE01000, v27, OS_LOG_TYPE_INFO, "%{public}@No unsyncable controller key, copying current controller key to unsyncable controller key", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v25);
        v46 = objc_msgSend(*(id *)(a1 + 32), "_saveKeyPair:username:syncable:keyType:", v23, v24, 0, &unk_1E8989470);
        if (v46)
        {
          v29 = (void *)MEMORY[0x1D17B7244]();
          v30 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v32;
            _os_log_impl(&dword_1CCE01000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to create unsyncable controller key", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v29);
          goto LABEL_40;
        }
        v10 = 0;
        v8 = 0;
        goto LABEL_38;
      }
      v9 = 0;
      v10 = 0;
      v8 = 0;
      goto LABEL_39;
    }
    if (v7 == 1751999337)
    {
      v8 = v3;
      v9 = 0;
    }
    else
    {
      objc_msgSend(v3, "type");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      v13 = v3;
      v14 = v13;
      if (v12 == 1751216227)
        v9 = 0;
      else
        v9 = v13;
      if (v12 == 1751216227)
        v10 = v13;
      else
        v10 = 0;
      v15 = (void *)MEMORY[0x1D17B7244]();
      v16 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v18;
        _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "%{public}@No v3 controller key, copying current controller key to v3 controller key", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v14, "valueData");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_saveKeyPair:username:syncable:keyType:", v20, v21, 1, &unk_1E8989428);

      v8 = 0;
      if (v10)
      {
LABEL_21:
        if (!v9)
        {
LABEL_32:
          objc_msgSend(*(id *)(a1 + 32), "_getControllerKeychainItemForKeyType:error:", &unk_1E8989458, &v46);
          v40 = objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            v9 = (void *)v40;
            goto LABEL_39;
          }
          v41 = (void *)MEMORY[0x1D17B7244]();
          v42 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v48 = v44;
            _os_log_impl(&dword_1CCE01000, v43, OS_LOG_TYPE_INFO, "%{public}@No v0 controller key, copying current controller key to v0 controller key", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v41);
          v45 = *(void **)(a1 + 32);
          objc_msgSend(v3, "valueData");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "account");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "_saveKeyPair:username:syncable:keyType:", v23, v24, 1, &unk_1E8989458);
LABEL_38:

          v9 = 0;
        }
LABEL_39:

        v24 = v10;
        v23 = v8;
LABEL_40:

        goto LABEL_41;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_getControllerKeychainItemForKeyType:error:", &unk_1E8989440, &v46);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v33 = (void *)MEMORY[0x1D17B7244]();
      v34 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v48 = v36;
        _os_log_impl(&dword_1CCE01000, v35, OS_LOG_TYPE_INFO, "%{public}@No v2 controller key, copying current controller key to v2 controller key", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v33);
      v37 = *(void **)(a1 + 32);
      objc_msgSend(v3, "valueData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "account");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "_saveKeyPair:username:syncable:keyType:", v38, v39, 1, &unk_1E8989440);

      v10 = 0;
      if (v9)
        goto LABEL_39;
      goto LABEL_32;
    }
    v10 = (id)v22;
    goto LABEL_21;
  }
LABEL_41:

}

void __35__HAPSystemKeychainStore_configure__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  BOOL v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "keychainStoreUpdatedNotificationToken") == a2;
    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("HAPSystemKeychainStoreUpdatedNotification"), v6);

      WeakRetained = v6;
    }
  }

}

+ (id)systemStore
{
  if (systemStore_systemStoreAllocated != -1)
    dispatch_once(&systemStore_systemStoreAllocated, &__block_literal_global_204);
  return (id)systemStore_systemStore;
}

+ (id)getDictionaryFromGenericData:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)updateAccessoryPairingGenericData:(id)a3 updatedControllerKeyIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "getDictionaryFromGenericData:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("ctrlKeyId"));

  if (!v7)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("homeKitRegistered"));
  objc_msgSend((id)objc_opt_class(), "serializeDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)serializeDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      v8 = (void *)MEMORY[0x1D17B7244]();
      v9 = a1;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v16 = v11;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error occurred while serializing generic dictionary : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v12 = 0;
    }
    else
    {
      v12 = v5;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t93 != -1)
    dispatch_once(&logCategory__hmf_once_t93, &__block_literal_global_253);
  return (id)logCategory__hmf_once_v94;
}

+ (id)viewHintForType:(id)a3
{
  return __viewHintForKeyType(a3);
}

void __37__HAPSystemKeychainStore_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v94;
  logCategory__hmf_once_v94 = v0;

}

uint64_t __37__HAPSystemKeychainStore_systemStore__block_invoke()
{
  HAPSystemKeychainStore *v0;
  void *v1;

  v0 = objc_alloc_init(HAPSystemKeychainStore);
  v1 = (void *)systemStore_systemStore;
  systemStore_systemStore = (uint64_t)v0;

  return objc_msgSend((id)systemStore_systemStore, "configure");
}

@end
