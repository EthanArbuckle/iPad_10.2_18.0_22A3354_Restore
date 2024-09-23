@implementation HMDWalletPassLibrary

+ (id)logCategory
{
  if (logCategory__hmf_once_t32_146587 != -1)
    dispatch_once(&logCategory__hmf_once_t32_146587, &__block_literal_global_51_146588);
  return (id)logCategory__hmf_once_v33_146589;
}

void __65__HMDWalletPassLibrary_fetchHomeKeySupportedWithFlow_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544130;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Wallet responded to canAddSecureElementPassWithConfiguration with canAdd: %@, error: %@", (uint8_t *)&v11, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D28580];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "untrackedPlaceholderFlow");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDWalletPassLibrary fetchExpressEnablementConflictingPassDescriptionForPassAtURL:flow:completion:](self, "fetchExpressEnablementConflictingPassDescriptionForPassAtURL:flow:completion:", v8, v9, v7);

}

- (NSString)secureElementIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D67630], "primarySecureElementIdentifier");
}

- (id)walletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDWalletPassLibrary *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDHomeWalletKey *v18;
  void *v19;
  HMDWalletPassLibrary *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "passWithPassTypeIdentifier:serialNumber:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544386;
      v26 = v16;
      v27 = 2112;
      v28 = v17;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found pass with identifier: %@ and serial number: %@: %@", (uint8_t *)&v25, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    if (v12)
      v18 = -[HMDHomeWalletKey initWithPKPass:flow:]([HMDHomeWalletKey alloc], "initWithPKPass:flow:", v12, v10);
    else
      v18 = 0;

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
      objc_msgSend(v10, "UUID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2112;
      v30 = v8;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Invalid parameter when looking up wallet key. typeIdentifier: %@, serialNumber: %@", (uint8_t *)&v25, 0x2Au);

    }
    objc_autoreleasePoolPop(v19);
    v18 = 0;
  }

  return v18;
}

- (BOOL)isWalletVisible
{
  return objc_msgSend(MEMORY[0x1E0D67798], "isWalletVisible");
}

- (void)fetchHomeKeySupportedWithFlow:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0D66A10]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HMDWalletPassLibrary_fetchHomeKeySupportedWithFlow_completion___block_invoke;
  v12[3] = &unk_1E89B9648;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "canAddSecureElementPassWithConfiguration:completion:", v9, v12);

}

- (PKPassLibrary)passLibrary
{
  return (PKPassLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (id)createTemporaryPassDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0C99E98];
  HMDCreateHomeKitDaemonCacheDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDWalletPassLibrary)initWithWorkQueue:(id)a3
{
  id v5;
  HMDWalletPassLibrary *v6;
  HMDWalletPassLibrary *v7;
  uint64_t v8;
  PKPassLibrary *passLibrary;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDWalletPassLibrary;
  v6 = -[HMDWalletPassLibrary init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workQueue, a3);
    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    passLibrary = v7->_passLibrary;
    v7->_passLibrary = (PKPassLibrary *)v8;

  }
  return v7;
}

- (NSSet)walletKeys
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  HMDHomeWalletKey *v14;
  void *v15;
  HMDHomeWalletKey *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "passes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "secureElementPass", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isHomeKeyPass");

        if (v13)
        {
          v14 = [HMDHomeWalletKey alloc];
          objc_msgSend(MEMORY[0x1E0D28580], "untrackedPlaceholderFlow");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = -[HMDHomeWalletKey initWithPKPass:flow:](v14, "initWithPKPass:flow:", v11, v15);

          objc_msgSend(v3, "addObject:", v16);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v17;
}

- (void)start
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D6A788];
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handlePassLibraryDidChangeNotification_, v3, v4);

}

- (void)addPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__HMDWalletPassLibrary_addPassAtURL_flow_completion___block_invoke;
  v16[3] = &unk_1E89B9620;
  objc_copyWeak(&v20, &location);
  v13 = v9;
  v17 = v13;
  v14 = v8;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  objc_msgSend(v11, "addUnsignedPassesAtURLs:withCompletionHandler:", v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)updatePassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__HMDWalletPassLibrary_updatePassAtURL_flow_completion___block_invoke;
  v11[3] = &unk_1E89BB130;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "replaceUnsignedPassAtURL:withCompletionHandler:", v8, v11);

}

- (id)urlForWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passWithPassTypeIdentifier:serialNumber:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "passURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)removePassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDWalletPassLibrary *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "passWithPassTypeIdentifier:serialNumber:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544386;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v8;
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Removing pass with identifier: %@ and serial number: %@: %@", (uint8_t *)&v23, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDWalletPassLibrary passLibrary](v14, "passLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "removePass:", v12);

    -[HMDWalletPassLibrary walletKeys](v14, "walletKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count") == 0;

    +[HMDHomeKeyDataRecorder sharedRecorder](HMDHomeKeyDataRecorder, "sharedRecorder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "recordRemovedWalletKeyWithSerialNumber:noWalletKeysRemaining:", v9, v20);

  }
  return v12 != 0;
}

- (void)enableExpressWithAuthData:(id)a3 passTypeIdentifier:(id)a4 serialNumber:(id)a5 flow:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  HMDWalletPassLibrary *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDWalletPassLibrary *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMDWalletPassLibrary *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  _QWORD v52[5];
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "passWithPassTypeIdentifier:serialNumber:", v12, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v49 = v12;
    v50 = v14;
    v48 = v13;
    v18 = v17;
    objc_opt_class();
    v19 = objc_opt_isKindOfClass() & 1;
    if (v19)
      v20 = v18;
    else
      v20 = 0;
    v21 = v20;

    if (v19)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v18, "uniqueID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "expressPassConfigurationWithPassUniqueIdentifier:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1D17BA0A0]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v45 = v21;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "UUID");
        v46 = v25;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "isNFCExpressEnabled");
        HMFBooleanToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "isUWBExpressEnabled");
        HMFBooleanToString();
        v47 = v24;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v28;
        v57 = 2112;
        v58 = v29;
        v59 = 2112;
        v60 = v30;
        v61 = 2112;
        v62 = v31;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found current express config with expressEnabled: %@, UWBEnabled: %@", buf, 0x2Au);

        v25 = v46;
        v24 = v47;

        v21 = v45;
      }

      objc_autoreleasePoolPop(v25);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D48]), "initForPaymentPass:isNFCExpressEnabled:isUWBExpressEnabled:withTechologyTest:", v18, 1, objc_msgSend(v24, "isUWBExpressEnabled"), &__block_literal_global_146567);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke_2;
      v52[3] = &unk_1E89B96B0;
      v52[4] = v26;
      v14 = v50;
      v53 = v50;
      v54 = v15;
      objc_msgSend(v22, "setExpressWithPassConfiguration:credential:handler:", v32, v51, v52);

    }
    else
    {
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = self;
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "UUID");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v42;
        v57 = 2112;
        v58 = v43;
        v59 = 2112;
        v60 = v18;
        v61 = 2112;
        v62 = (id)objc_opt_class();
        v44 = v62;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass object is not of type payment pass %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v39);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))v15 + 2))(v15, v22);
      v14 = v50;
    }

    v13 = v48;
    v12 = v49;
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
      v36 = v14;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "UUID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v56 = v37;
      v57 = 2112;
      v58 = v38;
      v59 = 2112;
      v60 = v12;
      v61 = 2112;
      v62 = v13;
      _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to find pass with type identifier: %@ and serial number: %@", buf, 0x2Au);

      v14 = v36;
    }

    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v15 + 2))(v15, v21);
  }

}

- (BOOL)isExpressModeEnabledForPassUniqueIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  HMDWalletPassLibrary *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  HMDWalletPassLibrary *v22;
  NSObject *v23;
  void *v24;
  id v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passWithPassTypeIdentifier:serialNumber:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() & 1;
    if (v11)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    if (v11)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v10, "uniqueID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isExpressModeEnabledForPassUniqueIdentifier:", v15);

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
        v27 = 138543874;
        v28 = v24;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = (id)objc_opt_class();
        v25 = v32;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@Pass object is not of type payment pass %@:%@", (uint8_t *)&v27, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v16 = 0;
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to find pass with type identifier: %@ and serial number: %@", (uint8_t *)&v27, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (void)fetchIsExpressEnabledForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  HMDWalletPassLibrary *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDWalletPassLibrary *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDWalletPassLibrary *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "passWithPassTypeIdentifier:serialNumber:", v10, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v44 = v10;
    v45 = v12;
    v16 = v15;
    objc_opt_class();
    v17 = objc_opt_isKindOfClass() & 1;
    if (v17)
      v18 = v16;
    else
      v18 = 0;
    v19 = v18;

    if (v17)
    {
      v20 = objc_alloc_init(MEMORY[0x1E0D672B0]);
      objc_msgSend(v16, "uniqueID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "expressPassConfigurationWithPassUniqueIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v42 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "UUID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "isNFCExpressEnabled");
        HMFBooleanToString();
        v41 = v19;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "isUWBExpressEnabled");
        HMFBooleanToString();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v26;
        v48 = 2112;
        v49 = v40;
        v50 = 2112;
        v51 = v27;
        v52 = 2112;
        v53 = v28;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] Found current express config with expressEnabled: %@, UWBEnabled: %@", buf, 0x2Au);

        v19 = v41;
        v11 = v42;
      }

      objc_autoreleasePoolPop(v23);
      v13[2](v13, objc_msgSend(v22, "isNFCExpressEnabled"), 0);

    }
    else
    {
      v34 = (void *)MEMORY[0x1D17BA0A0]();
      v35 = self;
      HMFGetOSLogHandle();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v43 = v34;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v37;
        v48 = 2112;
        v49 = v38;
        v50 = 2112;
        v51 = v16;
        v52 = 2112;
        v53 = (id)objc_opt_class();
        v39 = v53;
        _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Pass object is not of type payment pass %@:%@", buf, 0x2Au);

        v34 = v43;
      }

      objc_autoreleasePoolPop(v34);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v20);
    }

    v10 = v44;
    v12 = v45;
  }
  else
  {
    v29 = (void *)MEMORY[0x1D17BA0A0]();
    v30 = self;
    HMFGetOSLogHandle();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v47 = v32;
      v48 = 2112;
      v49 = v33;
      v50 = 2112;
      v51 = v10;
      v52 = 2112;
      v53 = v11;
      _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Unable to find pass with type identifier: %@ and serial number: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v29);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, id))v13)[2](v13, 0, v19);
  }

}

- (id)passUniqueIDOfWalletKeyWithTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  HMDWalletPassLibrary *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDWalletPassLibrary *v20;
  NSObject *v21;
  void *v22;
  id v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "passWithPassTypeIdentifier:serialNumber:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_opt_class();
    v11 = objc_opt_isKindOfClass() & 1;
    if (v11)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    if (v11)
    {
      objc_msgSend(v10, "uniqueID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
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
        v25 = 138543874;
        v26 = v22;
        v27 = 2112;
        v28 = v10;
        v29 = 2112;
        v30 = (id)objc_opt_class();
        v23 = v30;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@Pass object is not of type payment pass %@:%@", (uint8_t *)&v25, 0x20u);

      }
      objc_autoreleasePoolPop(v19);
      v14 = 0;
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
      v25 = 138543874;
      v26 = v18;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to find pass with type identifier: %@ and serial number: %@", (uint8_t *)&v25, 0x20u);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (void)fetchExpressEnablementConflictingPassDescriptionForPassAtURL:(id)a3 flow:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  HMDWalletPassLibrary *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDWalletPassLibrary *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDWalletPassLibrary *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v49 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66DB0]), "initWithFileURL:error:", v8, &v49);
  v12 = v49;
  if (v11)
  {
    objc_msgSend(v11, "setOwnsFileURL:", 1);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0D66EC8], "createWithValidatedFileDataAccessor:", v11);
    objc_msgSend(v13, "paymentPass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[HMDWalletPassLibrary secureElementIdentifier](self, "secureElementIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
      {
        v50 = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
        v43 = v12;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v17);

        v18 = objc_alloc_init(MEMORY[0x1E0D672B0]);
        v41 = v16;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66D58]), "initForPaymentPass:withTechologyTest:", v14, &__block_literal_global_37_146548);
        v20 = objc_alloc(MEMORY[0x1E0D66D48]);
        objc_msgSend(v14, "secureElementPass");
        v21 = v10;
        v22 = v8;
        v23 = v9;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v20, "initWithPassInformation:forSecureElementPass:", v19, v24);

        v9 = v23;
        v8 = v22;
        v10 = v21;
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke_2;
        v46[3] = &unk_1E89B96F8;
        v48 = v21;
        v46[4] = self;
        v47 = v9;
        objc_msgSend(v18, "conflictingExpressPassIdentifiersForPassConfiguration:withCompletion:", v25, v46);

        v12 = v43;
        v16 = v41;
      }
      else
      {
        v36 = (void *)MEMORY[0x1D17BA0A0]();
        v37 = self;
        HMFGetOSLogHandle();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v45 = v12;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "UUID");
          v42 = v36;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v52 = v39;
          v53 = 2112;
          v54 = v40;
          _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, secure element identifier is nil", buf, 0x16u);

          v36 = v42;
          v12 = v45;
        }

        objc_autoreleasePoolPop(v36);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v18);
      }

    }
    else
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUID");
        v44 = v12;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v52 = v34;
        v53 = 2112;
        v54 = v35;
        v55 = 2112;
        v56 = v8;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, cannot create payment pass at url: %@", buf, 0x20u);

        v12 = v44;
      }

      objc_autoreleasePoolPop(v31);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v16);
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
      objc_msgSend(v9, "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v52 = v29;
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v8;
      _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to fetch express conflict, create data accessor for pass at url: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
  }

}

- (void)generateHomeKeyNFCInfoWithReaderPublicKey:(id)a3 readerIdentifier:(id)a4 flow:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  HMDWalletPassLibrary *v20;
  id v21;
  id v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__HMDWalletPassLibrary_generateHomeKeyNFCInfoWithReaderPublicKey_readerIdentifier_flow_completion___block_invoke;
  v18[3] = &unk_1E89B9720;
  v19 = v10;
  v20 = self;
  v21 = v11;
  v22 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  objc_msgSend(v14, "generateTransactionKeyWithReaderIdentifier:readerPublicKey:completion:", v17, v13, v18);

}

- (void)acquireAssertionOfType:(unint64_t)a3 withReason:(id)a4 completion:(id)a5
{
  objc_msgSend(MEMORY[0x1E0D66B80], "acquireAssertionOfType:withReason:completion:", a3, a4, a5);
}

- (void)fetchTransactionKeyForPassWithTypeIdentifier:(id)a3 serialNumber:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__HMDWalletPassLibrary_fetchTransactionKeyForPassWithTypeIdentifier_serialNumber_completion___block_invoke;
  v14[3] = &unk_1E89B9748;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v11, "fetchTransactionKeyForPassTypeIdentifier:serialNumber:completionHandler:", v10, v12, v14);

}

- (void)handlePassLibraryDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  id v33;
  id obj;
  _QWORD v35[5];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[6];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(v33, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A770]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "na_filter:", &__block_literal_global_46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        -[HMDWalletPassLibrary workQueue](self, "workQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_2;
        block[3] = &unk_1E89C2328;
        block[4] = self;
        block[5] = v13;
        dispatch_async(v14, block);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v10);
  }

  objc_msgSend(v33, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D6A7C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  objc_msgSend(v18, "na_filter:", &__block_literal_global_48_146529);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v39;
    v24 = *MEMORY[0x1E0D6A7E0];
    v25 = *MEMORY[0x1E0D6A7A8];
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v39 != v23)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v27, "hmf_stringForKey:", v24);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "hmf_stringForKey:", v25);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)v29;
        if (v28)
          v31 = v29 == 0;
        else
          v31 = 1;
        if (!v31)
        {
          -[HMDWalletPassLibrary workQueue](self, "workQueue");
          v32 = objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_4;
          v35[3] = &unk_1E89C20C8;
          v35[4] = self;
          v36 = v28;
          v37 = v30;
          dispatch_async(v32, v35);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v22);
  }

}

- (void)deleteKeyMaterialForSubCredentialId:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDWalletPassLibrary passLibrary](self, "passLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteKeyMaterialForSubCredentialId:", v4);

}

- (HMDWalletPassLibraryDelegate)delegate
{
  return (HMDWalletPassLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serialNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "passTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passLibrary:didAddPassWithSerialNumber:typeIdentifier:", v2, v3, v4);

}

void __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passLibrary:didRemovePassWithSerialNumber:typeIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

uint64_t __63__HMDWalletPassLibrary_handlePassLibraryDidChangeNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  v3 = objc_opt_isKindOfClass() & (v2 != 0);

  return v3;
}

void __93__HMDWalletPassLibrary_fetchTransactionKeyForPassWithTypeIdentifier_serialNumber_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "length") == 65)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_5:
    v7();
    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 40);
    v15 = 138544130;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2048;
    v20 = objc_msgSend(v5, "length");
    v21 = 2048;
    v22 = 65;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch transaction key for pass with serial number: %@, received unexpected transaction key length: %lu expected: %lu", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

LABEL_9:
}

void __99__HMDWalletPassLibrary_generateHomeKeyNFCInfoWithReaderPublicKey_readerIdentifier_flow_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  HMDHomeWalletKeySecureElementInfo *v16;
  void *v17;
  HMDHomeWalletKeySecureElementInfo *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  HMDHomeWalletKeySecureElementInfo *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  id v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11 && v12 && v13 && v14 && *(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(v14, "length") == 65)
    {
      v16 = [HMDHomeWalletKeySecureElementInfo alloc];
      objc_msgSend(*(id *)(a1 + 32), "hmf_hexadecimalRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDHomeWalletKeySecureElementInfo initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:](v16, "initWithDeviceCredentialKey:applicationIdentifier:subCredentialIdentifier:secureElementIdentifier:pairedReaderIdentifier:paymentCredentialType:", v14, v12, v13, v11, v17, 0);

      v19 = *(_QWORD *)(a1 + 56);
      v44 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v19 + 16))(v19, v20, 0);

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "UUID");
        v43 = v13;
        v36 = v12;
        v37 = v11;
        v38 = v15;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v46 = v35;
        v47 = 2112;
        v48 = v39;
        v49 = 2048;
        v50 = objc_msgSend(v14, "length");
        v51 = 2048;
        v52 = 65;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info, received unexpected transaction key length: %lu expected: %lu", buf, 0x2Au);

        v15 = v38;
        v11 = v37;
        v12 = v36;
        v13 = v43;

      }
      objc_autoreleasePoolPop(v32);
      v40 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v40 + 16))(v40, 0, v41);

    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = v14;
      v25 = v13;
      v26 = v12;
      v27 = v11;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "UUID");
      v42 = v21;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138545154;
      v46 = v29;
      v47 = 2112;
      v48 = v30;
      v49 = 2112;
      v50 = (uint64_t)v27;
      v51 = 2112;
      v52 = (uint64_t)v26;
      v53 = 2112;
      v54 = v25;
      v55 = 2112;
      v56 = v24;
      v57 = 2112;
      v58 = v31;
      v59 = 2112;
      v60 = v28;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to generate home key nfc info because either secureElementIdentifier: %@ is nil or applicationIdentifier: %@ is nil or subCredentialIdentifier: %@ is nil or transactionKey: %@ is nil or readerIdentifier is nil: %@ error: %@", buf, 0x52u);

      v21 = v42;
      v15 = v28;
      v11 = v27;
      v12 = v26;
      v13 = v25;
      v14 = v24;
    }

    objc_autoreleasePoolPop(v21);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "passLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "passWithUniqueID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "localizedDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, 0);
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
          v24 = 138543874;
          v25 = v20;
          v26 = 2112;
          v27 = v21;
          v28 = 2112;
          v29 = v4;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to look up for localized description for conflicting pass with identifier: %@", (uint8_t *)&v24, 0x20u);

        }
        objc_autoreleasePoolPop(v17);
        v22 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

        v8 = 0;
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "UUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v14;
        v26 = 2112;
        v27 = v15;
        v28 = 2112;
        v29 = v4;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to look up for express enablement conflicting pass with identifier: %@", (uint8_t *)&v24, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v16 + 16))(v16, 0, v8);
    }

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __101__HMDWalletPassLibrary_fetchExpressEnablementConflictingPassDescriptionForPassAtURL_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D67630], "supportsExpressForAutomaticSelectionTechnologyType:", a2);
}

void __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@[Flow: %@] Failed to set express config. Current state is: %@", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
}

uint64_t __98__HMDWalletPassLibrary_enableExpressWithAuthData_passTypeIdentifier_serialNumber_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D67630], "supportsExpressForAutomaticSelectionTechnologyType:", a2);
}

void __56__HMDWalletPassLibrary_updatePassAtURL_flow_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

  }
}

void __53__HMDWalletPassLibrary_addPassAtURL_flow_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v13 = 138544130;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = a2;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@[Flow: %@] addUnsignedPassesAtURLs: %@, finished with status: %ld", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  v11 = *(_QWORD *)(a1 + 48);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
  }

}

void __35__HMDWalletPassLibrary_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v33_146589;
  logCategory__hmf_once_v33_146589 = v0;

}

@end
