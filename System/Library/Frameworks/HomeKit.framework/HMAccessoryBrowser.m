@implementation HMAccessoryBrowser

- (HMAccessoryBrowser)init
{
  HMAccessoryBrowser *v2;
  _HMContext *v3;
  _HMContext *context;
  uint64_t v5;
  HMMutableArray *accessories;
  void *v7;
  uint64_t v8;
  NSUUID *uuid;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMAccessoryBrowser;
  v2 = -[HMAccessoryBrowser init](&v11, sel_init);
  if (v2)
  {
    v3 = -[_HMContext initWithName:]([_HMContext alloc], "initWithName:", CFSTR("com.apple.HomeKit.AccessoryBrowser"));
    context = v2->_context;
    v2->_context = v3;

    if (initializeMappingsAndPaths_pred != -1)
      dispatch_once(&initializeMappingsAndPaths_pred, &__block_literal_global_22112);
    +[HMMutableArray array](HMMutableArray, "array");
    v5 = objc_claimAutoreleasedReturnValue();
    accessories = v2->_accessories;
    v2->_accessories = (HMMutableArray *)v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("BF2B0921-858B-42F5-B2EB-C915FB953E5B"));
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v8;

    v2->_generationCounter = -1;
    v2->_browsing = 0;
    -[HMAccessoryBrowser _start](v2, "_start");

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  HMAccessoryBrowser *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  objc_super v10;
  _QWORD block[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating HMAccessoryBrowser", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMutableArray array](v4->_accessories, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMContext queue](v4->_context, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__HMAccessoryBrowser_dealloc__block_invoke;
  block[3] = &unk_1E3AB5E18;
  v12 = v7;
  v9 = v7;
  dispatch_async(v8, block);

  v10.receiver = v4;
  v10.super_class = (Class)HMAccessoryBrowser;
  -[HMAccessoryBrowser dealloc](&v10, sel_dealloc);
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = delegate;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)discoveredAccessories
{
  void *v2;
  void *v3;

  -[HMAccessoryBrowser accessories](self, "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)startSearchingForNewAccessories
{
  void *v3;
  void *v4;
  HMAccessoryBrowser *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v8;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Asked to start searching for new accessories", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__HMAccessoryBrowser_startSearchingForNewAccessories__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = v5;
    dispatch_async(v9, block);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2080;
      v15 = "-[HMAccessoryBrowser startSearchingForNewAccessories]";
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

- (void)_startSearchingForNewAccessories
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  uint64_t v18;
  _BYTE location[12];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessoryBrowser uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTarget:", v5);

    v7 = (void *)MEMORY[0x1E0D285F8];
    v17 = CFSTR("kStartSearch");
    v18 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("kSearchForNewAccessoriesRequestKey"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __54__HMAccessoryBrowser__startSearchingForNewAccessories__block_invoke;
    v15[3] = &unk_1E3AB47E0;
    objc_copyWeak(&v16, (id *)location);
    objc_msgSend(v9, "setResponseHandler:", v15);
    objc_msgSend(v3, "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:", v9);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v14;
      v20 = 2080;
      v21 = "-[HMAccessoryBrowser _startSearchingForNewAccessories]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)handleStartWithError:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMAccessoryBrowser *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  HMAccessoryBrowser *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessoryBrowser context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__HMAccessoryBrowser_handleStartWithError_response___block_invoke;
    block[3] = &unk_1E3AB5CD0;
    v16 = v6;
    v17 = v7;
    v18 = self;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2080;
      v22 = "-[HMAccessoryBrowser handleStartWithError:response:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (void)stopSearchingForNewAccessories
{
  void *v3;
  HMAccessoryBrowser *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1A1AC1AAC](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Asked to stop searching for new accessories", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMAccessoryBrowser stopSearchingForNewAccessoriesWithError:](v4, "stopSearchingForNewAccessoriesWithError:", 0);
}

- (void)stopSearchingForNewAccessoriesWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMAccessoryBrowser *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryBrowser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __62__HMAccessoryBrowser_stopSearchingForNewAccessoriesWithError___block_invoke;
    v12[3] = &unk_1E3AB5ED8;
    v12[4] = self;
    v13 = v4;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2080;
      v17 = "-[HMAccessoryBrowser stopSearchingForNewAccessoriesWithError:]";
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_stopSearchingForNewAccessoriesWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMAccessoryBrowser *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  const __CFString *v29;
  uint64_t v30;
  _BYTE location[12];
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryBrowser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v21;
      v32 = 2080;
      v33 = "-[HMAccessoryBrowser _stopSearchingForNewAccessoriesWithError:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    goto LABEL_13;
  }
  if (!-[HMAccessoryBrowser isBrowsing](self, "isBrowsing"))
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v22;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@Asked to stop searching for new accessories but we are not currently browsing", location, 0xCu);

    }
LABEL_13:

    objc_autoreleasePoolPop(v18);
    goto LABEL_14;
  }
  v6 = (void *)MEMORY[0x1E0C99E08];
  v29 = CFSTR("kStartSearch");
  v30 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("kStopSearchReason"));

  }
  v10 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMAccessoryBrowser uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithTarget:", v11);

  v13 = (void *)MEMORY[0x1E0D285F8];
  v14 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v13, "messageWithName:destination:payload:", CFSTR("kSearchForNewAccessoriesRequestKey"), v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)location, self);
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke;
  v26 = &unk_1E3AB35B8;
  objc_copyWeak(&v28, (id *)location);
  v16 = v5;
  v27 = v16;
  objc_msgSend(v15, "setResponseHandler:", &v23);
  objc_msgSend(v16, "messageDispatcher", v23, v24, v25, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sendMessage:", v15);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)location);

LABEL_14:
}

- (void)_start
{
  void *v3;
  void *v4;
  void *v5;
  HMAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _BYTE location[12];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HMAccessoryBrowser _registerNotificationHandlers](self, "_registerNotificationHandlers");
    objc_initWeak((id *)location, self);
    objc_msgSend(v3, "xpcClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__HMAccessoryBrowser__start__block_invoke;
    v9[3] = &unk_1E3AB61D0;
    objc_copyWeak(&v10, (id *)location);
    objc_msgSend(v4, "registerReconnectionHandler:", v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v8;
      v12 = 2080;
      v13 = "-[HMAccessoryBrowser _start]";
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)_fetchNewAccessoriesWithPrivacyCheck
{
  void *v3;
  void *v4;
  void *v5;
  HMAccessoryBrowser *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _BYTE location[12];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak((id *)location, self);
    objc_msgSend(v3, "queue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__HMAccessoryBrowser__fetchNewAccessoriesWithPrivacyCheck__block_invoke;
    v9[3] = &unk_1E3AB35E0;
    objc_copyWeak(&v10, (id *)location);
    __HMPrivacyRequestAccessForService(*MEMORY[0x1E0DB11E8], v4, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v8;
      v12 = 2080;
      v13 = "-[HMAccessoryBrowser _fetchNewAccessoriesWithPrivacyCheck]";
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

- (void)_fetchNewAccessories
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAccessoryBrowser *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  const __CFString *v18;
  void *v19;
  _BYTE location[12];
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMAccessoryBrowser uuid](self, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithTarget:", v5);

    v7 = (void *)MEMORY[0x1E0D285F8];
    v18 = CFSTR("kConfigGenerationCounterKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessoryBrowser generationCounter](self, "generationCounter"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageWithName:destination:payload:", CFSTR("kFetchNewAccessoriesRequestKey"), v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)location, self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __42__HMAccessoryBrowser__fetchNewAccessories__block_invoke;
    v16[3] = &unk_1E3AB47E0;
    objc_copyWeak(&v17, (id *)location);
    objc_msgSend(v10, "setResponseHandler:", v16);
    objc_msgSend(v3, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:", v10);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)location);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v15;
      v21 = 2080;
      v22 = "-[HMAccessoryBrowser _fetchNewAccessories]";
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)_updateNewAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  uint64_t v43;
  void *v44;
  void *v45;
  id obj;
  id obja;
  id objb;
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  HMAccessoryBrowser *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  HMAccessoryBrowser *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryBrowser delegate](self, "delegate");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  obj = (id)objc_opt_new();
  v50 = (void *)objc_opt_new();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[HMAccessoryBrowser discoveredAccessories](self, "discoveredAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v76 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        objc_msgSend(v11, "uniqueIdentifier", obj);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hmf_firstObjectWithUniqueIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v5;
        else
          v14 = v50;
        objc_msgSend(v14, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    }
    while (v8);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v15 = v4;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  v17 = obj;
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v72 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
        objc_msgSend(v21, "uniqueIdentifier", obj);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "hmf_firstObjectWithUniqueIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          objc_msgSend(v17, "addObject:", v21);

      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v18);
  }

  objc_msgSend(v5, "addObjectsFromArray:", v17);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v24 = v17;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v68 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
        -[HMAccessoryBrowser context](self, "context", obj);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "__configureWithContext:home:", v30, 0);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    }
    while (v26);
  }

  -[HMAccessoryBrowser accessories](self, "accessories");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setArray:", v5);

  if (v49 && -[HMAccessoryBrowser isBrowsing](self, "isBrowsing"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obja = v50;
      v32 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v64;
        do
        {
          for (m = 0; m != v33; ++m)
          {
            if (*(_QWORD *)v64 != v34)
              objc_enumerationMutation(obja);
            v36 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * m);
            -[HMAccessoryBrowser context](self, "context");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "delegateCaller");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __44__HMAccessoryBrowser__updateNewAccessories___block_invoke;
            v59[3] = &unk_1E3AB5CD0;
            v60 = v49;
            v61 = self;
            v62 = v36;
            objc_msgSend(v38, "invokeBlock:", v59);

          }
          v33 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
        }
        while (v33);
      }

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      objb = v24;
      v39 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v56;
        do
        {
          for (n = 0; n != v40; ++n)
          {
            if (*(_QWORD *)v56 != v41)
              objc_enumerationMutation(objb);
            v43 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * n);
            -[HMAccessoryBrowser context](self, "context");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "delegateCaller");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v51[0] = MEMORY[0x1E0C809B0];
            v51[1] = 3221225472;
            v51[2] = __44__HMAccessoryBrowser__updateNewAccessories___block_invoke_2;
            v51[3] = &unk_1E3AB5CD0;
            v52 = v49;
            v53 = self;
            v54 = v43;
            objc_msgSend(v45, "invokeBlock:", v51);

          }
          v40 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
        }
        while (v40);
      }

    }
  }

}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessoryBrowser *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _BYTE location[12];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[HMAccessoryBrowser context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak((id *)location, self);
    -[HMAccessoryBrowser context](self, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__HMAccessoryBrowser__registerNotificationHandlers__block_invoke;
    v15[3] = &unk_1E3AB4BF0;
    objc_copyWeak(&v16, (id *)location);
    objc_msgSend(v5, "registerForMessage:receiver:messageHandler:", CFSTR("kNewAccessoriesFoundNotificationKey"), self, v15);

    -[HMAccessoryBrowser context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __51__HMAccessoryBrowser__registerNotificationHandlers__block_invoke_2;
    v13[3] = &unk_1E3AB4BF0;
    objc_copyWeak(&v14, (id *)location);
    objc_msgSend(v8, "registerForMessage:receiver:messageHandler:", CFSTR("kNewAccessoriesRemovedNotificationKey"), self, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v12;
      v18 = 2080;
      v19 = "-[HMAccessoryBrowser _registerNotificationHandlers]";
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", location, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_handleNewAccessoriesFound:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  HMAccessoryBrowser *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  HMAccessoryBrowser *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char *v60;
  id obj;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  void *v67;
  HMAccessoryBrowser *v68;
  _QWORD v69[4];
  id v70;
  HMAccessoryBrowser *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  id v82;
  HMAccessoryBrowser *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _QWORD v98[2];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  const char *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryBrowser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v68 = self;
    objc_msgSend(v4, "dataForKey:", CFSTR("kAccessoriesInfoDataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && -[HMAccessoryBrowser isBrowsing](self, "isBrowsing"))
    {
      v7 = (void *)MEMORY[0x1E0CB3710];
      v8 = (void *)MEMORY[0x1E0C99E60];
      v98[0] = objc_opt_class();
      v98[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v93);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = (char *)v93;

      if (v11)
      {
        v55 = v11;
        v12 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v14;
        objc_msgSend(v15, "setArray:", v14);
        -[HMAccessoryBrowser delegate](v68, "delegate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "conformsToProtocol:", &unk_1EE45A170);

        v67 = 0;
        if (v17)
        {
          -[HMAccessoryBrowser delegate](v68, "delegate");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        -[HMAccessoryBrowser discoveredAccessories](v68, "discoveredAccessories", v55, v6, v5, v4);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
        if (v64)
        {
          v62 = *(_QWORD *)v90;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v90 != v62)
                objc_enumerationMutation(obj);
              v65 = v18;
              v19 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v18);
              v85 = 0u;
              v86 = 0u;
              v87 = 0u;
              v88 = 0u;
              v20 = v63;
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
              if (v21)
              {
                v22 = v21;
                v23 = *(_QWORD *)v86;
                do
                {
                  for (i = 0; i != v22; ++i)
                  {
                    if (*(_QWORD *)v86 != v23)
                      objc_enumerationMutation(v20);
                    v25 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
                    objc_msgSend(v19, "uuid");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "uuid");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v26, "isEqual:", v27);

                    if (v28)
                    {
                      objc_msgSend(v19, "_updateFromAccessory:", v25);
                      if (objc_msgSend(v15, "count")
                        && -[HMAccessoryBrowser isBrowsing](v68, "isBrowsing")
                        && (objc_opt_respondsToSelector() & 1) != 0)
                      {
                        -[HMAccessoryBrowser context](v68, "context");
                        v29 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v29, "delegateCaller");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v81[0] = MEMORY[0x1E0C809B0];
                        v81[1] = 3221225472;
                        v81[2] = __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke;
                        v81[3] = &unk_1E3AB5CD0;
                        v82 = v67;
                        v83 = v68;
                        v84 = v19;
                        objc_msgSend(v30, "invokeBlock:", v81);

                      }
                      objc_msgSend(v15, "removeObject:", v25);
                    }
                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
                }
                while (v22);
              }

              v18 = v65 + 1;
            }
            while (v65 + 1 != v64);
            v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          }
          while (v64);
        }

        -[HMAccessoryBrowser accessories](v68, "accessories");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObjectsFromArray:", v15);

        v79 = 0u;
        v80 = 0u;
        v78 = 0u;
        v77 = 0u;
        v32 = v15;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v78 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
              -[HMAccessoryBrowser context](v68, "context");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "__configureWithContext:home:", v38, 0);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v77, v95, 16);
          }
          while (v34);
        }

        -[HMAccessoryBrowser delegate](v68, "delegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "count")
          && -[HMAccessoryBrowser isBrowsing](v68, "isBrowsing")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v66 = v32;
          v40 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v74;
            do
            {
              for (k = 0; k != v41; ++k)
              {
                if (*(_QWORD *)v74 != v42)
                  objc_enumerationMutation(v66);
                v44 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
                -[HMAccessoryBrowser context](v68, "context");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "delegateCaller");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v69[0] = MEMORY[0x1E0C809B0];
                v69[1] = 3221225472;
                v69[2] = __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke_2;
                v69[3] = &unk_1E3AB5CD0;
                v70 = v39;
                v71 = v68;
                v72 = v44;
                objc_msgSend(v46, "invokeBlock:", v69);

              }
              v41 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
            }
            while (v41);
          }

        }
        v5 = v58;
        v4 = v59;
        v11 = v56;
        v6 = v57;
      }
      else
      {
        v51 = (void *)MEMORY[0x1A1AC1AAC]();
        v52 = v68;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v100 = v54;
          v101 = 2112;
          v102 = v60;
          _os_log_impl(&dword_19B1B0000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessories from accessories data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v51);
      }

    }
  }
  else
  {
    v47 = (void *)MEMORY[0x1A1AC1AAC]();
    v48 = self;
    HMFGetOSLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v100 = v50;
      v101 = 2080;
      v102 = "-[HMAccessoryBrowser _handleNewAccessoriesFound:]";
      _os_log_impl(&dword_19B1B0000, v49, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v47);
  }

}

- (void)_handleNewAccessoriesRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  HMAccessoryBrowser *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  HMAccessoryBrowser *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  char *v47;
  HMAccessoryBrowser *v48;
  id obj;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  HMAccessoryBrowser *v56;
  uint64_t v57;
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
  id v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _QWORD v74[2];
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  const char *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryBrowser context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "dataForKey:", CFSTR("kAccessoriesInfoDataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB3710];
      v8 = (void *)MEMORY[0x1E0C99E60];
      v74[0] = objc_opt_class();
      v74[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v10, v6, &v70);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (char *)v70;

      if (v11)
      {
        v44 = v6;
        v45 = v5;
        v46 = v4;
        v43 = v11;
        v12 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v51 = v13;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v48 = self;
        -[HMAccessoryBrowser discoveredAccessories](self, "discoveredAccessories");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v52 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        if (v52)
        {
          v50 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v52; i = (char *)i + 1)
            {
              if (*(_QWORD *)v67 != v50)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
              v62 = 0u;
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v17 = v51;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v63;
                do
                {
                  for (j = 0; j != v19; ++j)
                  {
                    if (*(_QWORD *)v63 != v20)
                      objc_enumerationMutation(v17);
                    v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                    objc_msgSend(v16, "uuid");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "uuid");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v23, "isEqual:", v24);

                    if (v25)
                      objc_msgSend(v14, "addObject:", v16);
                  }
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
                }
                while (v19);
              }

            }
            v52 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          }
          while (v52);
        }

        -[HMAccessoryBrowser accessories](v48, "accessories");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeObjectsInArray:", v14);

        -[HMAccessoryBrowser delegate](v48, "delegate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "count")
          && -[HMAccessoryBrowser isBrowsing](v48, "isBrowsing")
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v53 = v14;
          v28 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v59;
            do
            {
              for (k = 0; k != v29; ++k)
              {
                if (*(_QWORD *)v59 != v30)
                  objc_enumerationMutation(v53);
                v32 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * k);
                -[HMAccessoryBrowser context](v48, "context");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "delegateCaller");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v54[0] = MEMORY[0x1E0C809B0];
                v54[1] = 3221225472;
                v54[2] = __51__HMAccessoryBrowser__handleNewAccessoriesRemoved___block_invoke;
                v54[3] = &unk_1E3AB5CD0;
                v55 = v27;
                v56 = v48;
                v57 = v32;
                objc_msgSend(v34, "invokeBlock:", v54);

              }
              v29 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
            }
            while (v29);
          }

        }
        v5 = v45;
        v4 = v46;
        v11 = v43;
        v6 = v44;
      }
      else
      {
        v39 = (void *)MEMORY[0x1A1AC1AAC]();
        v40 = self;
        HMFGetOSLogHandle();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v42;
          v77 = 2112;
          v78 = v47;
          _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessories from accessories data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
      }

    }
  }
  else
  {
    v35 = (void *)MEMORY[0x1A1AC1AAC]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v38;
      v77 = 2080;
      v78 = "-[HMAccessoryBrowser _handleNewAccessoriesRemoved:]";
      _os_log_impl(&dword_19B1B0000, v37, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v35);
  }

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMAccessoryBrowser context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return self->_context;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (HMMutableArray)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (unint64_t)generationCounter
{
  return self->_generationCounter;
}

- (void)setGenerationCounter:(unint64_t)a3
{
  self->_generationCounter = a3;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __51__HMAccessoryBrowser__handleNewAccessoriesRemoved___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser:didRemoveNewAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser:didUpdateNewAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __49__HMAccessoryBrowser__handleNewAccessoriesFound___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser:didFindNewAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __51__HMAccessoryBrowser__registerNotificationHandlers__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleNewAccessoriesFound:", v3);

}

void __51__HMAccessoryBrowser__registerNotificationHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleNewAccessoriesRemoved:", v3);

}

uint64_t __44__HMAccessoryBrowser__updateNewAccessories___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser:didRemoveNewAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __44__HMAccessoryBrowser__updateNewAccessories___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser:didFindNewAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __42__HMAccessoryBrowser__fetchNewAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 && v6)
    {
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kConfigGenerationCounterKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        goto LABEL_19;
      v11 = objc_msgSend(v9, "unsignedIntegerValue");
      if (v11 == objc_msgSend(v8, "generationCounter"))
        goto LABEL_19;
      objc_msgSend(v8, "setGenerationCounter:", objc_msgSend(v10, "unsignedIntegerValue"));
      objc_msgSend(v6, "hmf_dataForKey:", CFSTR("kAccessoriesInfoDataKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = (void *)MEMORY[0x1E0C99E60];
        v31[0] = objc_opt_class();
        v31[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v15, v12, &v26);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v26;
        if (!v16)
        {
          v21 = (void *)MEMORY[0x1A1AC1AAC]();
          v22 = v8;
          HMFGetOSLogHandle();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v25 = v21;
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v28 = v24;
            v29 = 2112;
            v30 = v17;
            _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive accessory from accessory data: %@", buf, 0x16u);

            v21 = v25;
          }

          objc_autoreleasePoolPop(v21);
          goto LABEL_18;
        }
        v18 = v16;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        v17 = v20;
      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v8, "_updateNewAccessories:", v17);
LABEL_18:

LABEL_19:
      goto LABEL_20;
    }
    objc_msgSend(WeakRetained, "_updateNewAccessories:", 0);
  }
LABEL_20:

}

void __58__HMAccessoryBrowser__fetchNewAccessoriesWithPrivacyCheck__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchNewAccessories");

}

void __28__HMAccessoryBrowser__start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setGenerationCounter:", -1);
  if (objc_msgSend(WeakRetained, "isBrowsing"))
    objc_msgSend(WeakRetained, "_startSearchingForNewAccessories");
  else
    objc_msgSend(WeakRetained, "_stopSearchingForNewAccessoriesWithError:", 0);

}

void __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke_2;
    block[3] = &unk_1E3AB5E18;
    block[4] = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __63__HMAccessoryBrowser__stopSearchingForNewAccessoriesWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "discoveredAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateNewAccessories:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setBrowsing:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setGenerationCounter:", -1);
}

uint64_t __62__HMAccessoryBrowser_stopSearchingForNewAccessoriesWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSearchingForNewAccessoriesWithError:", *(_QWORD *)(a1 + 40));
}

void __52__HMAccessoryBrowser_handleStartWithError_response___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "hmf_dataForKey:", CFSTR("kIdentifierSaltKey"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "hm_setIdentifierSalt:", v2);
      objc_msgSend(*(id *)(a1 + 48), "setBrowsing:", 1);
      objc_msgSend(*(id *)(a1 + 48), "_fetchNewAccessoriesWithPrivacyCheck");
    }
    else
    {
      v3 = (void *)MEMORY[0x1A1AC1AAC]();
      v4 = *(id *)(a1 + 48);
      HMFGetOSLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_ERROR, "%{public}@Missing identifier salt, failed to start browse", (uint8_t *)&v7, 0xCu);

      }
      objc_autoreleasePoolPop(v3);
    }

  }
}

void __54__HMAccessoryBrowser__startSearchingForNewAccessories__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleStartWithError:response:", v6, v5);

}

uint64_t __53__HMAccessoryBrowser_startSearchingForNewAccessories__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSearchingForNewAccessories");
}

void __29__HMAccessoryBrowser_dealloc__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_unconfigure", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_35303 != -1)
    dispatch_once(&logCategory__hmf_once_t24_35303, &__block_literal_global_35304);
  return (id)logCategory__hmf_once_v25_35305;
}

void __33__HMAccessoryBrowser_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_35305;
  logCategory__hmf_once_v25_35305 = v0;

}

@end
