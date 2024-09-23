@implementation HMCameraClipManager

- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMCameraClipManager *v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMCameraClipManager initWithContext:profileUniqueIdentifier:notificationCenter:](self, "initWithContext:profileUniqueIdentifier:notificationCenter:", v8, v7, v9);

  return v10;
}

- (HMCameraClipManager)initWithContext:(id)a3 profileUniqueIdentifier:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMCameraClipManager *v13;
  HMCameraClipManager *v14;
  uint64_t v15;
  NSUUID *profileUniqueIdentifier;
  uint64_t v17;
  NSMutableDictionary *clipsByFetchUUID;
  uint64_t v19;
  NSMutableDictionary *significantEventsByFetchUUID;
  uint64_t v21;
  NSMutableDictionary *videoAssetContextsByClipUUID;
  uint64_t v23;
  NSMapTable *delegateCallersByObservers;
  id fetchClientFactory;
  HMCameraClipManager *result;
  HMCameraClipManager *v27;
  SEL v28;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v27 = (HMCameraClipManager *)_HMFPreconditionFailure();
    -[HMCameraClipManager configure](v27, v28);
    return result;
  }
  v29.receiver = self;
  v29.super_class = (Class)HMCameraClipManager;
  v13 = -[HMCameraClipManager init](&v29, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    v15 = objc_msgSend(v10, "copy");
    profileUniqueIdentifier = v14->_profileUniqueIdentifier;
    v14->_profileUniqueIdentifier = (NSUUID *)v15;

    objc_storeStrong((id *)&v14->_notificationCenter, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    clipsByFetchUUID = v14->_clipsByFetchUUID;
    v14->_clipsByFetchUUID = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    significantEventsByFetchUUID = v14->_significantEventsByFetchUUID;
    v14->_significantEventsByFetchUUID = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    videoAssetContextsByClipUUID = v14->_videoAssetContextsByClipUUID;
    v14->_videoAssetContextsByClipUUID = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    delegateCallersByObservers = v14->_delegateCallersByObservers;
    v14->_delegateCallersByObservers = (NSMapTable *)v23;

    fetchClientFactory = v14->_fetchClientFactory;
    v14->_fetchClientFactory = &__block_literal_global_40698;

  }
  return v14;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMCameraClipManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMCCM.m.dcc"), self, sel_handleDidChangeClipsMessage_);

  -[HMCameraClipManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:selector:", CFSTR("HMCCM.m.dcse"), self, sel_handleDidChangeSignificantEventsMessage_);

  -[HMCameraClipManager notificationCenter](self, "notificationCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleDaemonReconnectedNotification_, CFSTR("HMDaemonReconnectedNotification"), 0);

}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMCameraClipManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)profileUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[NSMapTable keyEnumerator](self->_delegateCallersByObservers, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[HMCameraClipManager unsubscribe](self, "unsubscribe");
  -[HMCameraClipManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterReceiver:", self);

  v7.receiver = self;
  v7.super_class = (Class)HMCameraClipManager;
  -[HMCameraClipManager dealloc](&v7, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[HMCameraClipManager addObserver:queue:](self, "addObserver:queue:", a3, 0);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  HMDelegateCaller *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMCameraClipManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6)
  {
    v9 = -[HMDelegateCaller initWithQueue:]([HMDelegateCaller alloc], "initWithQueue:", v6);
  }
  else
  {
    -[HMCameraClipManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v9 = (HMDelegateCaller *)objc_claimAutoreleasedReturnValue();

  }
  -[HMCameraClipManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v9, v12);

  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
    -[HMCameraClipManager subscribe](self, "subscribe");

}

- (void)removeObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock_with_options();
  -[HMCameraClipManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HMCameraClipManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v9);

  -[HMCameraClipManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5)
    -[HMCameraClipManager unsubscribe](self, "unsubscribe");

}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Perform cloud pull"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Performing cloud pull", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v7, "profileUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.pcp"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__HMCameraClipManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E3AB60C8;
  v20[4] = v7;
  v21 = v5;
  v22 = v4;
  v16 = v4;
  v17 = v5;
  objc_msgSend(v15, "setResponseHandler:", v20);
  -[HMCameraClipManager context](v7, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:", v15);

}

- (id)videoSegmentsAssetContextForClip:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  HMCameraClipManager *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMCameraClipManager videoAssetContextsByClipUUID](self, "videoAssetContextsByClipUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "expirationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    if (v12 < 120.0)
    {
      v13 = (void *)MEMORY[0x1A1AC1AAC]();
      v14 = self;
      HMFGetOSLogHandle();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v16;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Video segments asset context for clip UUID %@ has expired: %@", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v13);
      -[HMCameraClipManager videoAssetContextsByClipUUID](v14, "videoAssetContextsByClipUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uniqueIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v20);

      v8 = 0;
    }

  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)fetchClipWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch clip for significant event"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clip with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v27 = CFSTR("HMCCM.mk.cu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.fc"), v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMCameraClipManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:completionHandler:", v19, 0);

}

- (void)fetchClipForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMCameraClipManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch clip for significant event"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v12;
    v38 = 2114;
    v39 = v14;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clip for significant event with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v34 = CFSTR("HMCCM.mk.seu");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.fcfse"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v10;
  v31 = v8;
  v32 = v6;
  v33 = v7;
  v21 = v6;
  v22 = v7;
  v23 = v8;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMCameraClipManager context](v10, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:completionHandler:", v20, 0);

}

- (void)fetchAllClipsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__HMCameraClipManager_fetchAllClipsWithCompletion___block_invoke;
  v10[3] = &unk_1E3AB5990;
  v11 = v4;
  v9 = v4;
  -[HMCameraClipManager fetchClipsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchClipsWithDateInterval:limit:shouldOrderAscending:completion:", v8, -1, 1, v10);

}

- (void)fetchClipsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  -[HMCameraClipManager fetchClipsWithDateInterval:quality:limit:shouldOrderAscending:completion:](self, "fetchClipsWithDateInterval:quality:limit:shouldOrderAscending:completion:", a3, 0, a4, a5, a6);
}

- (void)fetchClipsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  void *v12;
  void *v13;
  HMCameraClipManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  unint64_t v36;
  id v37;
  _QWORD v39[5];
  id v40;
  id v41;
  _QWORD v42[5];
  _QWORD v43[5];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  _BOOL4 v55;
  uint64_t v56;

  v8 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v37 = a7;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch clips with date interval"));
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v35 = v13;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMStringFromCameraClipQuality(a4);
    v36 = a5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v45 = v16;
    v46 = 2114;
    v47 = v18;
    v48 = 2112;
    v49 = v19;
    v50 = 2112;
    v51 = v11;
    v52 = 2048;
    v53 = v36;
    v54 = 1024;
    v55 = v8;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching clips with date interval: %@ quality: %@ limit: %lu shouldOrderAscending: %d", buf, 0x3Au);

    v13 = v35;
    a5 = v36;

  }
  objc_autoreleasePoolPop(v13);
  v20 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v14, "profileUniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithTarget:", v21);

  v42[0] = CFSTR("HMCCM.mk.daf");
  objc_msgSend(v11, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v23;
  v42[1] = CFSTR("HMCCM.mk.db");
  objc_msgSend(v11, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v24;
  v42[2] = CFSTR("HMCCM.mk.v");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v25;
  v42[3] = CFSTR("HMCCM.mk.l");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v26;
  v42[4] = CFSTR("HMCCM.mk.soa");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraClipManager fetchClientFactory](v14, "fetchClientFactory");
  v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipManager context](v14, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v29)[2](v29, v30, v31, CFSTR("HMCCM.m.fcs"), v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setClassForUnarchiving:", objc_opt_class());
  objc_msgSend(v32, "setPayload:", v28);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __96__HMCameraClipManager_fetchClipsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke;
  v39[3] = &unk_1E3AB3E50;
  v39[4] = v14;
  v40 = v12;
  v41 = v37;
  v33 = v37;
  v34 = v12;
  objc_msgSend(v32, "fetchWithCompletion:", v39);

}

- (void)fetchCountOfAllClipsWithCompletion:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

  -[HMCameraClipManager fetchCountOfClipsWithDateInterval:completion:](self, "fetchCountOfClipsWithDateInterval:completion:", v9, v5);
}

- (void)fetchCountOfClipsWithDateInterval:(id)a3 completion:(id)a4
{
  -[HMCameraClipManager fetchCountOfClipsWithDateInterval:quality:completion:](self, "fetchCountOfClipsWithDateInterval:quality:completion:", a3, 0, a4);
}

- (void)fetchCountOfClipsWithDateInterval:(id)a3 quality:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMCameraClipManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[3];
  _QWORD v37[3];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch count of clips with date interval"));
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v32 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMStringFromCameraClipQuality(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v14;
    v40 = 2114;
    v41 = v16;
    v42 = 2112;
    v43 = v8;
    v44 = 2112;
    v45 = v17;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of clips with date interval: %@ quality: %@", buf, 0x2Au);

    v9 = v32;
  }

  objc_autoreleasePoolPop(v11);
  v18 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v12, "profileUniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

  v36[0] = CFSTR("HMCCM.mk.daf");
  objc_msgSend(v8, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v21;
  v36[1] = CFSTR("HMCCM.mk.db");
  objc_msgSend(v8, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  v36[2] = CFSTR("HMCCM.mk.v");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D285F8];
  v26 = (void *)objc_msgSend(v24, "copy");
  objc_msgSend(v25, "messageWithName:destination:payload:", CFSTR("HMCCM.m.fcoc"), v20, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke;
  v33[3] = &unk_1E3AB60C8;
  v33[4] = v12;
  v34 = v10;
  v35 = v9;
  v28 = v9;
  v29 = v10;
  objc_msgSend(v27, "setResponseHandler:", v33);
  -[HMCameraClipManager context](v12, "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "messageDispatcher");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sendMessage:completionHandler:", v27, 0);

}

- (void)fetchHeroFrameDataRepresentationForClipWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch hero frame image data for clip"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching hero frame image data for clip with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v27 = CFSTR("HMCCM.mk.cu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.fhfdr"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMCameraClipManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:completionHandler:", v19, 0);

}

- (void)fetchHeroFrameURLOfClipWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMCameraClipManager *v29;
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch hero frame URL of clip"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    v37 = 2114;
    v38 = v14;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching hero frame url of clip with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v33 = CFSTR("HMCCM.mk.cu");
  v34 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.fhfu"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke;
  v28 = &unk_1E3AB4B08;
  v29 = v10;
  v30 = v8;
  v31 = v6;
  v32 = v7;
  v20 = v7;
  v21 = v6;
  v22 = v8;
  objc_msgSend(v19, "setResponseHandler:", &v25);
  -[HMCameraClipManager context](v10, "context", v25, v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v19, 0);

}

- (void)fetchFaceCropDataRepresentationForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  void *v29;
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
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch face crop image data for significant event"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v12;
    v32 = 2114;
    v33 = v14;
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crop image data for significant event with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v28 = CFSTR("HMCCM.mk.seu");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.ffcdr"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke;
  v25[3] = &unk_1E3AB60C8;
  v25[4] = v10;
  v26 = v8;
  v27 = v7;
  v21 = v7;
  v22 = v8;
  objc_msgSend(v20, "setResponseHandler:", v25);
  -[HMCameraClipManager context](v10, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v20, 0);

}

- (void)fetchFaceCropURLForSignificantEventWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMCameraClipManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch face crop URL for significant event"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v12;
    v38 = 2114;
    v39 = v14;
    v40 = 2112;
    v41 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching face crop url for significant event with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v34 = CFSTR("HMCCM.mk.seu");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.ffcu"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v10;
  v31 = v8;
  v32 = v6;
  v33 = v7;
  v21 = v7;
  v22 = v6;
  v23 = v8;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMCameraClipManager context](v10, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:completionHandler:", v20, 0);

}

- (void)fetchSignificantEventsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  const __CFString *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch significant events with UUIDs"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching significant events with UUIDs %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v27 = CFSTR("HMCCM.mk.seu");
  v28 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.fse"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke;
  v24[3] = &unk_1E3AB60C8;
  v24[4] = v10;
  v25 = v8;
  v26 = v7;
  v20 = v7;
  v21 = v8;
  objc_msgSend(v19, "setResponseHandler:", v24);
  -[HMCameraClipManager context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "messageDispatcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendMessage:completionHandler:", v19, 0);

}

- (void)fetchAllSignificantEventsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HMCameraClipManager_fetchAllSignificantEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E3AB5990;
  v11 = v4;
  v9 = v4;
  -[HMCameraClipManager fetchSignificantEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchSignificantEventsWithDateInterval:limit:shouldOrderAscending:completion:", v8, -1, 1, v10);

}

- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  -[HMCameraClipManager fetchSignificantEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchSignificantEventsWithDateInterval:limit:shouldOrderAscending:completion:", a3, a4, 1, a5);
}

- (void)fetchSignificantEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMCameraClipManager *v14;
  NSObject *v15;
  id v16;
  _BOOL8 v17;
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
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  _QWORD v39[4];
  _QWORD v40[4];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v7 = a5;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch significant events with date interval"));
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = v10;
    v17 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v35 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shortDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v42 = v18;
    v43 = 2114;
    v44 = v20;
    v45 = 2112;
    v46 = v16;
    v47 = 2048;
    v48 = a4;
    v49 = 1024;
    v50 = v17;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching significant events with date interval: %@ limit: %lu shouldOrderAscending: %d", buf, 0x30u);

    v11 = v35;
    v7 = v17;
    v10 = v16;
  }

  objc_autoreleasePoolPop(v13);
  v21 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v14, "profileUniqueIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithTarget:", v22);

  v39[0] = CFSTR("HMCCM.mk.daf");
  objc_msgSend(v10, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v24;
  v39[1] = CFSTR("HMCCM.mk.db");
  objc_msgSend(v10, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v25;
  v39[2] = CFSTR("HMCCM.mk.l");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v26;
  v39[3] = CFSTR("HMCCM.mk.soa");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraClipManager fetchClientFactory](v14, "fetchClientFactory");
  v29 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipManager context](v14, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, const __CFString *, void *))v29)[2](v29, v30, v31, CFSTR("HMCCM.m.fse"), v23);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "setClassForUnarchiving:", objc_opt_class());
  objc_msgSend(v32, "setPayload:", v28);
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __100__HMCameraClipManager_fetchSignificantEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke;
  v36[3] = &unk_1E3AB3E50;
  v36[4] = v14;
  v37 = v12;
  v38 = v11;
  v33 = v11;
  v34 = v12;
  objc_msgSend(v32, "fetchWithCompletion:", v36);

}

- (void)deleteClipWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMCameraClipManager *v29;
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Delete clip"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    v37 = 2114;
    v38 = v14;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Deleting clip with UUID %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v33 = CFSTR("HMCCM.mk.cu");
  v34 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.dc"), v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __53__HMCameraClipManager_deleteClipWithUUID_completion___block_invoke;
  v28 = &unk_1E3AB4B08;
  v29 = v10;
  v30 = v8;
  v31 = v6;
  v32 = v7;
  v20 = v7;
  v21 = v6;
  v22 = v8;
  objc_msgSend(v19, "setResponseHandler:", &v25);
  -[HMCameraClipManager context](v10, "context", v25, v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v19, 0);

}

- (void)deleteAllClipsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Delete all clips"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Deleting all clips", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v7, "profileUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.dac"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__HMCameraClipManager_deleteAllClipsWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E3AB60C8;
  v20[4] = v7;
  v21 = v5;
  v22 = v4;
  v16 = v4;
  v17 = v5;
  objc_msgSend(v15, "setResponseHandler:", v20);
  -[HMCameraClipManager context](v7, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:completionHandler:", v15, 0);

}

- (void)handleFaceMisclassificationForSignificantEvent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Handle face misclassification"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v12;
    v36 = 2114;
    v37 = v14;
    v38 = 2112;
    v39 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Handling face misclassification for significant event %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v31 = v6;
  v32 = CFSTR("HMCCM.mk.se");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  encodeRootObject(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.hfm"), v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __81__HMCameraClipManager_handleFaceMisclassificationForSignificantEvent_completion___block_invoke;
  v27[3] = &unk_1E3AB4B08;
  v27[4] = v10;
  v28 = v8;
  v29 = v6;
  v30 = v7;
  v22 = v7;
  v23 = v6;
  v24 = v8;
  objc_msgSend(v21, "setResponseHandler:", v27);
  -[HMCameraClipManager context](v10, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:completionHandler:", v21, 0);

}

- (void)donateClipsWithUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMCameraClipManager *v29;
  id v30;
  id v31;
  id v32;
  const __CFString *v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Handle feedback submission"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v12;
    v37 = 2114;
    v38 = v14;
    v39 = 2112;
    v40 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Handling feedback submission for clips %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v33 = CFSTR("HMCCM.mk.cus");
  v34 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCCM.m.sc"), v17, v18);
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __55__HMCameraClipManager_donateClipsWithUUIDs_completion___block_invoke;
  v28 = &unk_1E3AB4B08;
  v29 = v10;
  v30 = v8;
  v31 = v6;
  v32 = v7;
  v20 = v7;
  v21 = v6;
  v22 = v8;
  objc_msgSend(v19, "setResponseHandler:", &v25);
  -[HMCameraClipManager context](v10, "context", v25, v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v19, 0);

}

- (void)fetchVideoSegmentsAssetContextForClip:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  void (**v26)(id, void *, _QWORD);
  const __CFString *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch video segments asset context"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v30 = v12;
    v31 = 2114;
    v32 = v14;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching video segments asset context for clip %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMCameraClipManager videoSegmentsAssetContextForClip:](v10, "videoSegmentsAssetContextForClip:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v7[2](v7, v15, 0);
  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

    v27 = CFSTR("HMCCM.mk.cu");
    objc_msgSend(v6, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCCM.m.fvsac"), v18, v20);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke;
    v24[3] = &unk_1E3AB60C8;
    v24[4] = v10;
    v25 = v8;
    v26 = v7;
    objc_msgSend(v21, "setResponseHandler:", v24);
    -[HMCameraClipManager context](v10, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "messageDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sendMessage:completionHandler:", v21, 0);

  }
}

- (void)importClipsWithImportData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMCameraClipManager *v30;
  id v31;
  id v32;
  id v33;
  const __CFString *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Import clips"));
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "shortDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v12;
    v38 = 2114;
    v39 = v14;
    v40 = 2048;
    v41 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Importing %lu clips", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v10, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v34 = CFSTR("HMCCM.mk.cid");
  encodeRootObject(v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.ic"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __60__HMCameraClipManager_importClipsWithImportData_completion___block_invoke;
  v29 = &unk_1E3AB4B08;
  v30 = v10;
  v31 = v8;
  v32 = v6;
  v33 = v7;
  v21 = v7;
  v22 = v6;
  v23 = v8;
  objc_msgSend(v20, "setResponseHandler:", &v26);
  -[HMCameraClipManager context](v10, "context", v26, v27, v28, v29, v30);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageDispatcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sendMessage:completionHandler:", v20, 0);

}

- (void)fetchIsCloudStorageEnabledWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMCameraClipManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetching is cloud storage enabled"));
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching is cloud storage enabled", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  v12 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v7, "profileUniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.ficse"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __64__HMCameraClipManager_fetchIsCloudStorageEnabledWithCompletion___block_invoke;
  v20[3] = &unk_1E3AB60C8;
  v20[4] = v7;
  v21 = v5;
  v22 = v4;
  v16 = v4;
  v17 = v5;
  objc_msgSend(v15, "setResponseHandler:", v20);
  -[HMCameraClipManager context](v7, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:completionHandler:", v15, 0);

}

- (void)setCloudStorageEnabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  HMCameraClipManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *, void *);
  void *v28;
  HMCameraClipManager *v29;
  id v30;
  id v31;
  BOOL v32;
  const __CFString *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v4 = a3;
  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Updating cloud storage"));
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFEnabledStatusToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v11;
    v37 = 2114;
    v38 = v13;
    v39 = 2112;
    v40 = v14;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Setting cloud storage to %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v15 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v9, "profileUniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

  v33 = CFSTR("HMCMM.mk.ie");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.ucs"), v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __57__HMCameraClipManager_setCloudStorageEnabled_completion___block_invoke;
  v28 = &unk_1E3AB3E78;
  v29 = v9;
  v30 = v7;
  v32 = v4;
  v31 = v6;
  v21 = v6;
  v22 = v7;
  objc_msgSend(v20, "setResponseHandler:", &v25);
  -[HMCameraClipManager context](v9, "context", v25, v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "messageDispatcher");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sendMessage:completionHandler:", v20, 0);

}

- (void)updateVideoSegmentsAssetContextForClip:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *videoAssetContextsByClipUUID;
  void *v6;
  void *v7;
  HMCameraClipVideoHLSPlaylistGenerator *v8;
  void *v9;
  HMCameraClipVideoHLSPlaylistGenerator *v10;
  void *v11;
  void *v12;
  HMCameraClipVideoAssetContext *v13;
  void *v14;
  void *v15;
  void *v16;
  HMCameraClipVideoAssetContext *v17;
  NSMutableDictionary *v18;
  void *v19;
  id v20;

  v20 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  videoAssetContextsByClipUUID = self->_videoAssetContextsByClipUUID;
  objc_msgSend(v20, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](videoAssetContextsByClipUUID, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [HMCameraClipVideoHLSPlaylistGenerator alloc];
    objc_msgSend(v7, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMCameraClipVideoHLSPlaylistGenerator initWithClip:url:](v8, "initWithClip:url:", v20, v9);

    objc_msgSend(v20, "videoSegments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraClipVideoHLSPlaylistGenerator addSegments:](v10, "addSegments:", v11);

    if (objc_msgSend(v20, "isComplete"))
      -[HMCameraClipVideoHLSPlaylistGenerator finish](v10, "finish");
    -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylist](v10, "hlsPlaylist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HMCameraClipVideoAssetContext alloc];
    objc_msgSend(v7, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expirationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requiredHTTPHeaders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMCameraClipVideoAssetContext initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:](v13, "initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:", v14, v15, v16, v12);

    v18 = self->_videoAssetContextsByClipUUID;
    objc_msgSend(v20, "uniqueIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)subscribe
{
  void *v3;
  HMCameraClipManager *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to camera clip changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v4, "profileUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.s"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:completionHandler:", v10, 0);

}

- (void)unsubscribe
{
  void *v3;
  HMCameraClipManager *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
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
    v13 = 138543362;
    v14 = v6;
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from camera clip changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraClipManager profileUniqueIdentifier](v4, "profileUniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCCM.m.u"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:completionHandler:", v10, 0);

}

- (void)handleDidChangeClipsMessage:(id)a3
{
  void *v4;
  HMCameraClipManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  HMCameraClipManager *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  id v25;
  id obj;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  HMCameraClipManager *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  _QWORD v50[5];

  v50[2] = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v7;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling clips changed message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v50[0] = objc_opt_class();
  v50[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.uc"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "setForKey:", CFSTR("HMCCM.mk.rcu"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v10);
        -[HMCameraClipManager updateVideoSegmentsAssetContextForClip:](v5, "updateVideoSegmentsAssetContextForClip:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v11);
  }

  os_unfair_lock_lock_with_options();
  v28 = (void *)-[NSMapTable copy](v5->_delegateCallersByObservers, "copy");
  os_unfair_lock_unlock(&v5->_lock);
  v14 = (void *)MEMORY[0x1A1AC1AAC]();
  v15 = v5;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "count");
    v19 = objc_msgSend(v27, "count");
    *(_DWORD *)buf = 138543874;
    v44 = v17;
    v45 = 2048;
    v46 = v18;
    v47 = 2048;
    v48 = v19;
    _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated clips, %lu removed clip UUIDs", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v28, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v28, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __51__HMCameraClipManager_handleDidChangeClipsMessage___block_invoke;
        v29[3] = &unk_1E3AB59E8;
        v30 = v10;
        v31 = v23;
        v32 = v15;
        v33 = v27;
        objc_msgSend(v24, "invokeBlock:", v29);

      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  objc_msgSend(v25, "respondWithPayload:", 0);
}

- (void)handleDidChangeSignificantEventsMessage:(id)a3
{
  void *v4;
  HMCameraClipManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMCameraClipManager *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  HMCameraClipManager *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  _QWORD v42[5];

  v42[2] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v37 = v7;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling significant events changed message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.use"), v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setForKey:", CFSTR("HMCCM.mk.rseu"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  v25 = (void *)-[NSMapTable copy](v5->_delegateCallersByObservers, "copy");
  os_unfair_lock_unlock(&v5->_lock);
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = v5;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v24, "count");
    v14 = objc_msgSend(v23, "count");
    *(_DWORD *)buf = 138543874;
    v37 = v12;
    v38 = 2048;
    v39 = v13;
    v40 = 2048;
    v41 = v14;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated significant events, %lu removed significant event UUIDs", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v25, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v25, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v17;
        v26[1] = 3221225472;
        v26[2] = __63__HMCameraClipManager_handleDidChangeSignificantEventsMessage___block_invoke;
        v26[3] = &unk_1E3AB59E8;
        v27 = v24;
        v28 = v19;
        v29 = v10;
        v30 = v23;
        objc_msgSend(v20, "invokeBlock:", v26);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  objc_msgSend(v21, "respondWithPayload:", 0);
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  HMCameraClipManager *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  v9 = -[NSMapTable count](v6->_delegateCallersByObservers, "count");
  os_unfair_lock_unlock(&v6->_lock);
  if (v9)
    -[HMCameraClipManager subscribe](v6, "subscribe");

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMCameraClipManager profileUniqueIdentifier](self, "profileUniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableDictionary)clipsByFetchUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)significantEventsByFetchUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableDictionary)videoAssetContextsByClipUUID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 64, 1);
}

- (id)fetchClientFactory
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setFetchClientFactory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchClientFactory, 0);
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_videoAssetContextsByClipUUID, 0);
  objc_storeStrong((id *)&self->_significantEventsByFetchUUID, 0);
  objc_storeStrong((id *)&self->_clipsByFetchUUID, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_profileUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __63__HMCameraClipManager_handleDidChangeSignificantEventsMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "clipManager:didUpdateSignificantEvents:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 56), "count");
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 40), "clipManager:didRemoveSignificantEventsWithUUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return result;
}

uint64_t __51__HMCameraClipManager_handleDidChangeClipsMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "clipManager:didUpdateClips:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 56), "count");
  if (result)
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 40), "clipManager:didRemoveClipsWithUUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return result;
}

void __57__HMCameraClipManager_setCloudStorageEnabled_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to update cloud storage: %@", (uint8_t *)&v19, 0x20u);

LABEL_6:
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HMFEnabledStatusToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v11;
    v21 = 2114;
    v22 = v15;
    v23 = 2112;
    v24 = v16;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully set cloud storage to %@", (uint8_t *)&v19, 0x20u);

    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "delegateCaller");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __64__HMCameraClipManager_fetchIsCloudStorageEnabledWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMCMM.mk.ie"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "BOOLValue");
      HMFEnabledStatusToString();
      v26 = v8;
      v15 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v12;
      v29 = 2114;
      v30 = v14;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched is cloud storage enabled: %@", buf, 0x20u);

      v5 = v15;
      v8 = v26;

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 48);
    v21 = v7;
    v22 = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2114;
      v30 = v25;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch is cloud storage enabled: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = *(_QWORD *)(a1 + 48);
    v21 = 0;
    v22 = v5;
  }
  objc_msgSend(v18, "callCompletion:obj:error:", v20, v21, v22);

}

void __60__HMCameraClipManager_importClipsWithImportData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = (uint64_t)v5;
      v14 = "%{public}@[%{public}@] Failed to import clips: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(*(id *)(a1 + 48), "count");
    v20 = 138543874;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v24 = 2048;
    v25 = v17;
    v14 = "%{public}@[%{public}@] Successfully imported %lu clips";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
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
  HMCameraClipVideoHLSPlaylistGenerator *v17;
  void *v18;
  HMCameraClipVideoHLSPlaylistGenerator *v19;
  void *v20;
  void *v21;
  HMCameraClipVideoAssetContext *v22;
  void *v23;
  void *v24;
  void *v25;
  HMCameraClipVideoAssetContext *v26;
  os_unfair_lock_s *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  HMCameraClipVideoAssetContext *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  HMCameraClipVideoAssetContext *v49;
  id v50;
  _QWORD v51[4];
  HMCameraClipVideoHLSPlaylistGenerator *v52;
  _QWORD v53[4];
  id v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v5 = a3;
  v64[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.ac"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v63 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.c"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = a1[4];
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v14;
        v57 = 2114;
        v58 = v16;
        v59 = 2112;
        v60 = v7;
        v61 = 2112;
        v62 = v9;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched video segments asset context: %@ clip: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v10);
      v17 = [HMCameraClipVideoHLSPlaylistGenerator alloc];
      objc_msgSend(v7, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[HMCameraClipVideoHLSPlaylistGenerator initWithClip:url:](v17, "initWithClip:url:", v9, v18);

      objc_msgSend(v9, "videoSegments");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraClipVideoHLSPlaylistGenerator addSegments:](v19, "addSegments:", v20);

      if (objc_msgSend(v9, "isComplete"))
        -[HMCameraClipVideoHLSPlaylistGenerator finish](v19, "finish");
      -[HMCameraClipVideoHLSPlaylistGenerator hlsPlaylist](v19, "hlsPlaylist");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = [HMCameraClipVideoAssetContext alloc];
      objc_msgSend(v7, "url");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "expirationDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "requiredHTTPHeaders");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMCameraClipVideoAssetContext initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:](v22, "initWithURL:expirationDate:requiredHTTPHeaders:hlsPlaylist:", v23, v24, v25, v21);

      v27 = (os_unfair_lock_s *)((char *)a1[4] + 8);
      os_unfair_lock_lock_with_options();
      v28 = (void *)*((_QWORD *)a1[4] + 7);
      objc_msgSend(v9, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, v29);

      os_unfair_lock_unlock(v27);
      objc_msgSend(a1[4], "context");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "delegateCaller");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_170;
      v48[3] = &unk_1E3AB60A0;
      v32 = a1[6];
      v49 = v26;
      v50 = v32;
      v33 = v26;
      objc_msgSend(v31, "invokeBlock:", v48);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "shortDescription");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v56 = v42;
        v57 = 2114;
        v58 = v44;
        v59 = 2112;
        v60 = v5;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(a1[4], "context");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "delegateCaller");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_167;
      v51[3] = &unk_1E3AB6078;
      v52 = (HMCameraClipVideoHLSPlaylistGenerator *)a1[6];
      objc_msgSend(v46, "invokeBlock:", v51);

      v19 = v52;
    }

  }
  else
  {
    v34 = (void *)MEMORY[0x1A1AC1AAC]();
    v35 = a1[4];
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "shortDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v37;
      v57 = 2114;
      v58 = v39;
      v59 = 2112;
      v60 = v5;
      _os_log_impl(&dword_19B1B0000, v36, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find video segments asset context in response payload %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v34);
    objc_msgSend(a1[4], "context");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "delegateCaller");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_166;
    v53[3] = &unk_1E3AB6078;
    v54 = a1[6];
    objc_msgSend(v41, "invokeBlock:", v53);

    v9 = v54;
  }

}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_166(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_167(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __72__HMCameraClipManager_fetchVideoSegmentsAssetContextForClip_completion___block_invoke_170(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __55__HMCameraClipManager_donateClipsWithUUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v22 = 138544130;
      v23 = v11;
      v24 = 2114;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v5;
      v15 = "%{public}@[%{public}@] Failed to handle feedback submission for clips %@: %@";
      v16 = v10;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v16, v17, v15, (uint8_t *)&v22, v18);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 48);
    v22 = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v13;
    v26 = 2112;
    v27 = v19;
    v15 = "%{public}@[%{public}@] Successfully handled feedback submission for clips %@";
    v16 = v10;
    v17 = OS_LOG_TYPE_INFO;
    v18 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "delegateCaller");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __81__HMCameraClipManager_handleFaceMisclassificationForSignificantEvent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v22 = 138544130;
      v23 = v11;
      v24 = 2114;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v5;
      v15 = "%{public}@[%{public}@] Failed to handle face misclassification for significant event %@: %@";
      v16 = v10;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v16, v17, v15, (uint8_t *)&v22, v18);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 48);
    v22 = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v13;
    v26 = 2112;
    v27 = v19;
    v15 = "%{public}@[%{public}@] Successfully handled face misclassification for significant event %@";
    v16 = v10;
    v17 = OS_LOG_TYPE_INFO;
    v18 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "delegateCaller");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __59__HMCameraClipManager_deleteAllClipsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      v14 = "%{public}@[%{public}@] Failed to delete all clips: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v14 = "%{public}@[%{public}@] Successfully deleted all clips";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

void __53__HMCameraClipManager_deleteClipWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      v22 = 138544130;
      v23 = v11;
      v24 = 2114;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v5;
      v15 = "%{public}@[%{public}@] Failed to delete clip with UUID %@: %@";
      v16 = v10;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 42;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v16, v17, v15, (uint8_t *)&v22, v18);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 48);
    v22 = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v13;
    v26 = 2112;
    v27 = v19;
    v15 = "%{public}@[%{public}@] Successfully deleted clip with UUID %@";
    v16 = v10;
    v17 = OS_LOG_TYPE_INFO;
    v18 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "delegateCaller");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __100__HMCameraClipManager_fetchSignificantEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2048;
      v22 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu significant events", (uint8_t *)&v17, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v16;
    v21 = 2112;
    v22 = (uint64_t)v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch significant events: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __63__HMCameraClipManager_fetchAllSignificantEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    objc_msgSend(v5, "setWithArray:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v7 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v8 = a3;
    v7(v3, 0);
  }

}

void __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(id, _QWORD, void *);
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.se"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched significant events: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke_146;
    v23[3] = &unk_1E3AB60A0;
    v25 = a1[6];
    v24 = v8;
    objc_msgSend(v17, "invokeBlock:", v23);

    v18 = v25;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "shortDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v19;
      v28 = 2114;
      v29 = v21;
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find significant events in response payload %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v22 = (void (**)(id, _QWORD, void *))a1[6];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2](v22, 0, v18);
  }

}

void __66__HMCameraClipManager_fetchSignificantEventsWithUUIDs_completion___block_invoke_146(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

void __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v39 = v11;
      v40 = 2114;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crop URL for significant event with UUID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_141;
    v35[3] = &unk_1E3AB60A0;
    v37 = *(id *)(a1 + 56);
    v36 = v5;
    objc_msgSend(v16, "invokeBlock:", v35);

    v17 = v37;
  }
  else
  {
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMCCM.mk.furl"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v31 = v7;
      v24 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v39 = v22;
      v40 = 2114;
      v41 = v25;
      v42 = 2112;
      v43 = v26;
      v44 = 2112;
      v45 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched face crop URL for significant event with UUID %@: %@", buf, 0x2Au);

      v19 = v24;
      v7 = v31;

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_142;
    v32[3] = &unk_1E3AB60A0;
    v29 = *(id *)(a1 + 56);
    v33 = v18;
    v34 = v29;
    v30 = v18;
    objc_msgSend(v28, "invokeBlock:", v32);

  }
}

uint64_t __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __78__HMCameraClipManager_fetchFaceCropURLForSignificantEventWithUUID_completion___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMCCM.mk.id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = a1[4];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = v5;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 2114;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched face crop image data: %@", buf, 0x20u);

      v5 = v25;
    }

    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_138;
    v26[3] = &unk_1E3AB60A0;
    v18 = &v28;
    v28 = a1[6];
    v19 = &v27;
    v27 = v7;
    v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v22;
      v34 = 2114;
      v35 = v24;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v21;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch face crop image data from response payload %@: %@", buf, 0x2Au);

      v5 = v21;
    }

    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_137;
    v29[3] = &unk_1E3AB60A0;
    v18 = &v31;
    v31 = a1[6];
    v19 = &v30;
    v30 = v5;
    v20 = v29;
  }
  objc_msgSend(v17, "invokeBlock:", v20);

}

uint64_t __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __93__HMCameraClipManager_fetchFaceCropDataRepresentationForSignificantEventWithUUID_completion___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v39 = v11;
      v40 = 2114;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch the hero frame of clip %@ due to error - %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_132;
    v35[3] = &unk_1E3AB60A0;
    v37 = *(id *)(a1 + 56);
    v36 = v5;
    objc_msgSend(v16, "invokeBlock:", v35);

    v17 = v37;
  }
  else
  {
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("HMCCM.mk.furl"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v31 = v7;
      v24 = v19;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v39 = v22;
      v40 = 2114;
      v41 = v25;
      v42 = 2112;
      v43 = v26;
      v44 = 2112;
      v45 = v18;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched hero frame URL for clip with UUID %@ : %@]", buf, 0x2Au);

      v19 = v24;
      v7 = v31;

    }
    objc_autoreleasePoolPop(v19);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "delegateCaller");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_134;
    v32[3] = &unk_1E3AB60A0;
    v29 = *(id *)(a1 + 56);
    v33 = v18;
    v34 = v29;
    v30 = v18;
    objc_msgSend(v28, "invokeBlock:", v32);

  }
}

uint64_t __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __66__HMCameraClipManager_fetchHeroFrameURLOfClipWithUUID_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_dataForKey:", CFSTR("HMCCM.mk.id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = a1[4];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = v5;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 2114;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched hero frame image data: %@", buf, 0x20u);

      v5 = v25;
    }

    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_129;
    v26[3] = &unk_1E3AB60A0;
    v18 = &v28;
    v28 = a1[6];
    v19 = &v27;
    v27 = v7;
    v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v33 = v22;
      v34 = 2114;
      v35 = v24;
      v36 = 2112;
      v37 = v6;
      v38 = 2112;
      v39 = v21;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch hero frame image data from response payload %@: %@", buf, 0x2Au);

      v5 = v21;
    }

    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_128;
    v29[3] = &unk_1E3AB60A0;
    v18 = &v31;
    v31 = a1[6];
    v19 = &v30;
    v30 = v5;
    v20 = v29;
  }
  objc_msgSend(v17, "invokeBlock:", v20);

}

uint64_t __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_128(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __82__HMCameraClipManager_fetchHeroFrameDataRepresentationForClipWithUUID_completion___block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id *v17;
  id *v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMCCM.mk.coc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = a1[4];
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v12;
      v34 = 2114;
      v35 = v14;
      v36 = 2112;
      v37 = v7;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ clips", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_125;
    v26 = &unk_1E3AB60A0;
    v17 = &v28;
    v28 = a1[6];
    v18 = &v27;
    v27 = v7;
    v19 = &v23;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v20;
      v34 = 2114;
      v35 = v22;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch count of clips: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_124;
    v29[3] = &unk_1E3AB60A0;
    v17 = &v31;
    v31 = a1[6];
    v18 = &v30;
    v30 = v5;
    v19 = v29;
  }
  objc_msgSend(v16, "invokeBlock:", v19, v23, v24, v25, v26, v27);

}

uint64_t __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __76__HMCameraClipManager_fetchCountOfClipsWithDateInterval_quality_completion___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __96__HMCameraClipManager_fetchClipsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v13;
      v21 = 2048;
      v22 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu clips", (uint8_t *)&v17, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543874;
    v18 = v14;
    v19 = 2114;
    v20 = v16;
    v21 = 2112;
    v22 = (uint64_t)v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch clips: %@", (uint8_t *)&v17, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __51__HMCameraClipManager_fetchAllClipsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = a3;
    objc_msgSend(v5, "setWithArray:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v7 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v8 = a3;
    v7(v3, 0);
  }

}

void __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v38[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.c"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      v31 = v13;
      v32 = 2114;
      v33 = v15;
      v34 = 2112;
      v35 = v16;
      v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched clip for significant event with UUID %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_116;
    v25[3] = &unk_1E3AB60A0;
    v19 = &v27;
    v27 = *(id *)(a1 + 56);
    v26 = v8;
    objc_msgSend(v18, "invokeBlock:", v25);

    v20 = v26;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      v32 = 2114;
      v33 = v23;
      v34 = 2112;
      v35 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "context");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "delegateCaller");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_115;
    v28[3] = &unk_1E3AB6078;
    v19 = &v29;
    v29 = *(id *)(a1 + 56);
    objc_msgSend(v24, "invokeBlock:", v28);

  }
}

void __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_115(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __71__HMCameraClipManager_fetchClipForSignificantEventWithUUID_completion___block_invoke_116(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v35[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCCM.mk.c"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = a1[4];
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shortDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v13;
      v31 = 2114;
      v32 = v15;
      v33 = 2112;
      v34 = v8;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched clip: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(a1[4], "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "delegateCaller");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_113;
    v24[3] = &unk_1E3AB60A0;
    v18 = &v26;
    v26 = a1[6];
    v25 = v8;
    objc_msgSend(v17, "invokeBlock:", v24);

    v19 = v25;
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "shortDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v20;
      v31 = 2114;
      v32 = v22;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Could not find clip in response payload: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(a1[4], "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_110;
    v27[3] = &unk_1E3AB6078;
    v18 = &v28;
    v28 = a1[6];
    objc_msgSend(v23, "invokeBlock:", v27);

  }
}

void __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_110(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __52__HMCameraClipManager_fetchClipWithUUID_completion___block_invoke_113(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __54__HMCameraClipManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v24 = 2112;
      v25 = v5;
      v14 = "%{public}@[%{public}@] Failed to perform cloud pull: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v20, v17);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v13;
    v14 = "%{public}@[%{public}@] Successfully performed cloud pull";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    v17 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", *(_QWORD *)(a1 + 48), v5);

}

HMCameraObjectFetchClient *__82__HMCameraClipManager_initWithContext_profileUniqueIdentifier_notificationCenter___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  HMCameraObjectFetchClient *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = -[HMCameraObjectFetchClient initWithUUID:context:messageName:destination:]([HMCameraObjectFetchClient alloc], "initWithUUID:context:messageName:destination:", v11, v10, v9, v8);

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t74 != -1)
    dispatch_once(&logCategory__hmf_once_t74, &__block_literal_global_185);
  return (id)logCategory__hmf_once_v75;
}

void __34__HMCameraClipManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v75;
  logCategory__hmf_once_v75 = v0;

}

@end
