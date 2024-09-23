@implementation HMDDonationHandler

- (HMDDonationHandler)init
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

- (void)donateActionSet:(id)a3 withMessage:(id)a4
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
  -[HMDDonationHandler workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HMDDonationHandler_donateActionSet_withMessage___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeIntentForActionSet:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDDonationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__HMDDonationHandler_removeIntentForActionSet___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_init
{
  HMDDonationHandler *v2;
  const char *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HMDDonationHandler;
  v2 = -[HMDDonationHandler init](&v8, sel_init);
  if (v2)
  {
    v3 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create(v3, v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_donateActionSet:(id)a3 withMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  HMDDonationHandler *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  _QWORD *v41;
  uint64_t v42;
  HMDDonationHandler *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDDonationHandler *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  HMDDonationHandler *v60;
  _BYTE buf[12];
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  void *v66;
  _QWORD v67[2];

  v67[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v42 = MEMORY[0x1D17BA0A0]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v45;
      v62 = 2112;
      v63 = v46;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@There is no action in Action Set: %@", buf, 0x16u);

LABEL_14:
    }
LABEL_15:

    v47 = (void *)v42;
LABEL_16:
    objc_autoreleasePoolPop(v47);
    goto LABEL_17;
  }
  if (!+[HMDDeviceCapabilities supportsIntentDonation](HMDDeviceCapabilities, "supportsIntentDonation"))
  {
    v42 = MEMORY[0x1D17BA0A0]();
    v43 = self;
    HMFGetOSLogHandle();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@HomePod is not eligible for intent donation", buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v10 = parseMessageSource(v7);
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
  if (v10 != 5)
  {
    if (v14)
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMetricsUtilities stringForSource:](HMDMetricsUtilities, "stringForSource:", v10);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v48;
      v62 = 2112;
      v63 = v49;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@The trigger source \"%@\" is not supported for donation in HomeKit. HomeKit intent donation only supports First Party App.", buf, 0x16u);

    }
    v47 = v11;
    goto LABEL_16;
  }
  if (v14)
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMetricsUtilities stringForSource:](HMDMetricsUtilities, "stringForSource:", 5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationBundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v15;
    v62 = 2112;
    v63 = v16;
    v64 = 2112;
    v65 = v17;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@The trigger source is: \"%@\" (bundleID: %@)", buf, 0x20u);

  }
  v59 = v7;

  objc_autoreleasePoolPop(v11);
  v18 = v6;
  objc_msgSend(v18, "spiClientIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "spiClientIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0CBDC00]);
  v60 = v12;
  v21 = v19;
  objc_msgSend(v19, "UUIDString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(v20, "initWithIdentifier:string:", v22, v23);
  v25 = objc_alloc(MEMORY[0x1E0CBDC00]);
  objc_msgSend(v58, "UUIDString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v25, "initWithIdentifier:string:", v26, v27);

  v29 = objc_alloc(MEMORY[0x1E0CBD950]);
  objc_msgSend(v21, "UUIDString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "initWithEntityIdentifiers:home:scene:homeZone:group:room:accessory:service:entityType:serviceType:subServiceType:", v31, v28, v24, 0, 0, 0, 0, 0, 5, 0, 0);

  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD938]), "initWithType:BOOLValue:", 1, 1);
  v34 = objc_alloc(MEMORY[0x1E0CBD940]);
  v67[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithFilter:actions:", v32, v35);

  v37 = objc_alloc(MEMORY[0x1E0CBD810]);
  v66 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v37, "initWithContents:", v38);

  v40 = isWatch();
  v41 = (_QWORD *)MEMORY[0x1E0CB9608];
  if (!v40)
    v41 = (_QWORD *)MEMORY[0x1E0CB8D08];
  objc_msgSend(v39, "_setLaunchId:", *v41);
  objc_msgSend(v39, "_setExtensionBundleId:", CFSTR("com.apple.HomeKit.HomeKitIntentExtension"));

  if (v39)
  {
    -[HMDDonationHandler _donateIntent:withActionSet:](v60, "_donateIntent:withActionSet:", v39, v18);
  }
  else
  {
    v50 = (void *)MEMORY[0x1D17BA0A0]();
    v51 = v60;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "home");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "name");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v53;
      v62 = 2112;
      v63 = v54;
      v64 = 2112;
      v65 = v56;
      _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the intent of Action Set \"%@\" in Home \"%@\", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v50);
  }

  v7 = v59;
LABEL_17:

}

- (void)_donateIntent:(id)a3 withActionSet:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  HMDDonationHandler *v16;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0CBD9A8];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithIntent:response:", v6, 0);
  objc_msgSend(v8, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDHomeManager deriveIntentGroupIdentifierFromBaseUUID:](HMDHomeManager, "deriveIntentGroupIdentifierFromBaseUUID:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupIdentifier:", v12);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__HMDDonationHandler__donateIntent_withActionSet___block_invoke;
  v14[3] = &unk_1E89C21C0;
  v15 = v6;
  v16 = self;
  v13 = v6;
  objc_msgSend(v9, "donateInteractionWithCompletion:", v14);

}

- (void)_removeIntentForActionSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeManager deriveIntentGroupIdentifierFromBaseUUID:](HMDHomeManager, "deriveIntentGroupIdentifierFromBaseUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = isWatch();
  v8 = (id *)MEMORY[0x1E0CB9608];
  if (!v7)
    v8 = (id *)MEMORY[0x1E0CB8D08];
  v9 = (void *)MEMORY[0x1E0CA6B38];
  v10 = *v8;
  objc_msgSend(v9, "defaultSearchableIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__HMDDonationHandler__removeIntentForActionSet___block_invoke;
  v15[3] = &unk_1E89C21C0;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  objc_msgSend(v11, "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:", v13, v10, 0, v15);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __48__HMDDonationHandler__removeIntentForActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
      objc_msgSend(*(id *)(a1 + 40), "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v3;
      v12 = "%{public}@Failed to remove intents for Action Set \"%@\" in Home \"%@\" with error - %@";
      v13 = v7;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 42;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v13, v14, v12, (uint8_t *)&v16, v15);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v11;
    v12 = "%{public}@Successfully remove home intent(s) for Action Set \"%@\" in Home \"%@\" to Siri Actions";
    v13 = v7;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __50__HMDDonationHandler__donateIntent_withActionSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "contents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v14;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v3;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to donate home intent of Action Set \"%@\" in Home \"%@\" with error - %@", (uint8_t *)&v17, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    v17 = 138544130;
    v18 = v15;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v9;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully donate home intent(s) of Action Set \"%@\" in Home \"%@\" to Siri Actions - intent: %@", (uint8_t *)&v17, 0x2Au);

  }
  objc_autoreleasePoolPop(v10);

}

uint64_t __47__HMDDonationHandler_removeIntentForActionSet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeIntentForActionSet:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__HMDDonationHandler_donateActionSet_withMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donateActionSet:withMessage:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)sharedDonationHandler
{
  if (sharedDonationHandler_onceToken != -1)
    dispatch_once(&sharedDonationHandler_onceToken, &__block_literal_global_141344);
  return (id)sharedDonationHandler_donationHandler;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_141339 != -1)
    dispatch_once(&logCategory__hmf_once_t9_141339, &__block_literal_global_15_141340);
  return (id)logCategory__hmf_once_v10_141341;
}

void __33__HMDDonationHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_141341;
  logCategory__hmf_once_v10_141341 = v0;

}

void __43__HMDDonationHandler_sharedDonationHandler__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[HMDDonationHandler _init]([HMDDonationHandler alloc], "_init");
  v1 = (void *)sharedDonationHandler_donationHandler;
  sharedDonationHandler_donationHandler = (uint64_t)v0;

}

@end
