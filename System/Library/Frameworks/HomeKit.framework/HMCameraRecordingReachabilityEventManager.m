@implementation HMCameraRecordingReachabilityEventManager

- (void)configure
{
  void *v3;
  void *v4;
  id v5;

  -[HMCameraRecordingReachabilityEventManager context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerForMessage:receiver:selector:", CFSTR("HMCRREM.m.dcem"), self, sel_handleDidChangeEventsMessage_);

  -[HMCameraRecordingReachabilityEventManager notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_handleDaemonReconnectedNotification_, CFSTR("HMDaemonReconnectedNotification"), 0);

}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMCameraRecordingReachabilityEventManager *v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMCameraRecordingReachabilityEventManager initWithContext:uniqueIdentifier:notificationCenter:](self, "initWithContext:uniqueIdentifier:notificationCenter:", v8, v7, v9);

  return v10;
}

- (HMCameraRecordingReachabilityEventManager)initWithContext:(id)a3 uniqueIdentifier:(id)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMCameraRecordingReachabilityEventManager *v13;
  HMCameraRecordingReachabilityEventManager *v14;
  uint64_t v15;
  NSMapTable *delegateCallersByObservers;
  HMCameraRecordingEventManager *v18;
  SEL v19;
  id v20;
  id v21;
  id v22;
  objc_super v23;

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
    v18 = (HMCameraRecordingEventManager *)_HMFPreconditionFailure();
    return (HMCameraRecordingReachabilityEventManager *)-[HMCameraRecordingEventManager initWithContext:clipManager:reachabilityEventManager:](v18, v19, v20, v21, v22);
  }
  v23.receiver = self;
  v23.super_class = (Class)HMCameraRecordingReachabilityEventManager;
  v13 = -[HMCameraRecordingReachabilityEventManager init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_uniqueIdentifier, a4);
    objc_storeStrong((id *)&v14->_notificationCenter, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    delegateCallersByObservers = v14->_delegateCallersByObservers;
    v14->_delegateCallersByObservers = (NSMapTable *)v15;

  }
  return v14;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMCameraRecordingReachabilityEventManager context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
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
    -[HMCameraRecordingReachabilityEventManager unsubscribe](self, "unsubscribe");
  -[HMCameraRecordingReachabilityEventManager context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deregisterReceiver:", self);

  v7.receiver = self;
  v7.super_class = (Class)HMCameraRecordingReachabilityEventManager;
  -[HMCameraRecordingReachabilityEventManager dealloc](&v7, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[HMCameraRecordingReachabilityEventManager addObserver:queue:](self, "addObserver:queue:", a3, 0);
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
  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6)
  {
    v9 = -[HMDelegateCaller initWithQueue:]([HMDelegateCaller alloc], "initWithQueue:", v6);
  }
  else
  {
    -[HMCameraRecordingReachabilityEventManager context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v9 = (HMDelegateCaller *)objc_claimAutoreleasedReturnValue();

  }
  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v9, v12);

  os_unfair_lock_unlock(&self->_lock);
  if (!v8)
    -[HMCameraRecordingReachabilityEventManager subscribe](self, "subscribe");

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
  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v9);

  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5)
    -[HMCameraRecordingReachabilityEventManager unsubscribe](self, "unsubscribe");

}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMCameraRecordingReachabilityEventManager *v7;
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
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v7, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTarget:", v13);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCRREM.m.pcp"), v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HMCameraRecordingReachabilityEventManager_performCloudPullWithCompletion___block_invoke;
  v20[3] = &unk_1E3AB60C8;
  v20[4] = v7;
  v21 = v5;
  v22 = v4;
  v16 = v4;
  v17 = v5;
  objc_msgSend(v15, "setResponseHandler:", v20);
  -[HMCameraRecordingReachabilityEventManager context](v7, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageDispatcher");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendMessage:", v15);

}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMCameraRecordingReachabilityEventManager *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  unint64_t v45;
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v7 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch reachability events with date interval"));
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v34 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shortDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v39 = v16;
    v40 = 2114;
    v41 = v18;
    v42 = 2112;
    v43 = v10;
    v44 = 2048;
    v45 = a4;
    v46 = 1024;
    v47 = v7;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching reachability events with date interval: %@ limit: %lu shouldOrderAscending: %d", buf, 0x30u);

    v11 = v34;
  }

  objc_autoreleasePoolPop(v13);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("HMCRREM.mk.da"));

  objc_msgSend(v10, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("HMCRREM.mk.db"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v22, CFSTR("HMCRREM.mk.l"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("HMCRREM.mk.soa"));

  v24 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v14, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithTarget:", v25);

  v27 = (void *)MEMORY[0x1E0D285F8];
  v28 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v27, "messageWithName:destination:payload:", CFSTR("HMCRREM.m.fem"), v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke;
  v35[3] = &unk_1E3AB60C8;
  v35[4] = v14;
  v36 = v12;
  v37 = v11;
  v30 = v11;
  v31 = v12;
  objc_msgSend(v29, "setResponseHandler:", v35);
  -[HMCameraRecordingReachabilityEventManager context](v14, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "messageDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sendMessage:", v29);

}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  -[HMCameraRecordingReachabilityEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", a3, a4, 1, a5);
}

- (void)fetchEventsBeforeDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (objc_class *)MEMORY[0x1E0CB3588];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v10);

  -[HMCameraRecordingReachabilityEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", v13, a4, 0, v9);
}

- (void)fetchEventsAfterDate:(id)a3 withLimit:(unint64_t)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v8 = (objc_class *)MEMORY[0x1E0CB3588];
  v9 = a5;
  v10 = a3;
  v11 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "initWithStartDate:endDate:", v10, v12);

  -[HMCameraRecordingReachabilityEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", v13, a4, 1, v9);
}

- (void)fetchAllEventsWithCompletion:(id)a3
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
  v10[2] = __74__HMCameraRecordingReachabilityEventManager_fetchAllEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E3AB5990;
  v11 = v4;
  v9 = v4;
  -[HMCameraRecordingReachabilityEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", v8, -1, 1, v10);

}

- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraRecordingReachabilityEventManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
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
  id v24;
  id v25;
  void *v26;
  void *v27;
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
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch count of reachability events with date interval"));
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
    v32 = v12;
    v33 = 2114;
    v34 = v14;
    v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of reachability events with date interval %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("HMCRREM.mk.da"));

  objc_msgSend(v6, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("HMCRREM.mk.db"));

  v18 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v10, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);

  v21 = (void *)MEMORY[0x1E0D285F8];
  v22 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v21, "messageWithName:destination:payload:", CFSTR("HMCRREM.m.fcoem"), v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke;
  v28[3] = &unk_1E3AB60C8;
  v28[4] = v10;
  v29 = v8;
  v30 = v7;
  v24 = v7;
  v25 = v8;
  objc_msgSend(v23, "setResponseHandler:", v28);
  -[HMCameraRecordingReachabilityEventManager context](v10, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "messageDispatcher");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sendMessage:", v23);

}

- (void)fetchCountOfAllEventsWithCompletion:(id)a3
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

  -[HMCameraRecordingReachabilityEventManager fetchCountOfEventsWithDateInterval:completion:](self, "fetchCountOfEventsWithDateInterval:completion:", v9, v5);
}

- (void)deleteAllEventsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMCameraRecordingReachabilityEventManager *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  HMCameraRecordingReachabilityEventManager *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting all reachability events", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v9 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v6, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCRREM.m.daem"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke;
  v19 = &unk_1E3AB59B8;
  v20 = v6;
  v21 = v4;
  v13 = v4;
  objc_msgSend(v12, "setResponseHandler:", &v16);
  -[HMCameraRecordingReachabilityEventManager context](v6, "context", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sendMessage:completionHandler:", v12, 0);

}

- (void)subscribe
{
  void *v3;
  HMCameraRecordingReachabilityEventManager *v4;
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
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Subscribing to camera reachability event changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCRREM.m.sm"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingReachabilityEventManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v10);

}

- (void)unsubscribe
{
  void *v3;
  HMCameraRecordingReachabilityEventManager *v4;
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
    _os_log_impl(&dword_19B1B0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from camera reachability event changes", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](v4, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMCRREM.m.um"), v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingReachabilityEventManager context](v4, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendMessage:", v10);

}

- (void)handleDidChangeEventsMessage:(id)a3
{
  void *v4;
  HMCameraRecordingReachabilityEventManager *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  HMCameraRecordingReachabilityEventManager *v10;
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
  HMCameraRecordingReachabilityEventManager *v29;
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
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling reachability events changed message", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v4);
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unarchivedObjectForKey:ofClasses:", CFSTR("HMCRREM.mk.ue"), v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setForKey:", CFSTR("HMCRREM.mk.reu"));
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
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated events, %lu removed event UUIDs", buf, 0x20u);

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
        v26[2] = __74__HMCameraRecordingReachabilityEventManager_handleDidChangeEventsMessage___block_invoke;
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

  objc_msgSend(v21, "respondWithSuccess");
}

- (void)handleDaemonReconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  HMCameraRecordingReachabilityEventManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling daemon reconnected notification by reconnecting to daemon if necessary", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[HMCameraRecordingReachabilityEventManager delegateCallersByObservers](v6, "delegateCallersByObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") == 0;

  os_unfair_lock_unlock(&v6->_lock);
  if (!v10)
    -[HMCameraRecordingReachabilityEventManager subscribe](v6, "subscribe");

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMCameraRecordingReachabilityEventManager uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __74__HMCameraRecordingReachabilityEventManager_handleDidChangeEventsMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "reachabilityEventManager:didUpdateReachabilityEvents:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 56), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "reachabilityEventManager:didRemoveReachabilityEventsWithUUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      v12 = "%{public}@Failed to delete all reachability events: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, buf, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v11;
    v12 = "%{public}@Successfully deleted all reachability events";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegateCaller");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke_62;
  v20[3] = &unk_1E3AB60A0;
  v18 = *(id *)(a1 + 40);
  v21 = v5;
  v22 = v18;
  v19 = v5;
  objc_msgSend(v17, "invokeBlock:", v20);

}

uint64_t __82__HMCameraRecordingReachabilityEventManager_deleteAllEventsWithCompletionHandler___block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke(id *a1, void *a2, void *a3)
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
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v11;
      v35 = 2114;
      v36 = v13;
      v37 = 2112;
      v38 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch count of reachability events: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[4], "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_60;
    v30[3] = &unk_1E3AB60A0;
    v32 = a1[6];
    v31 = v5;
    objc_msgSend(v15, "invokeBlock:", v30);

    v16 = v32;
  }
  else
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMCRREM.mk.coe"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = a1[4];
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v21;
      v35 = 2114;
      v36 = v23;
      v37 = 2048;
      v38 = objc_msgSend(v17, "unsignedIntegerValue");
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %lu reachability events", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(a1[4], "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "delegateCaller");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_61;
    v27[3] = &unk_1E3AB60A0;
    v26 = a1[6];
    v28 = v17;
    v29 = v26;
    v16 = v17;
    objc_msgSend(v25, "invokeBlock:", v27);

  }
}

uint64_t __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __91__HMCameraRecordingReachabilityEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __74__HMCameraRecordingReachabilityEventManager_fetchAllEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

void __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[2];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v10;
      v37 = 2114;
      v38 = v12;
      v39 = 2112;
      v40 = (uint64_t)v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%{public}@] Failed to fetch reachability events: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(a1[4], "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_49;
    v31[3] = &unk_1E3AB60A0;
    v33 = a1[6];
    v32 = v5;
    objc_msgSend(v14, "invokeBlock:", v31);

    v15 = v33;
  }
  else
  {
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_unarchivedObjectForKey:ofClasses:", CFSTR("HMCRREM.mrk.fe"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = a1[4];
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "shortDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v17, "count");
      *(_DWORD *)buf = 138543874;
      v36 = v21;
      v37 = 2114;
      v38 = v23;
      v39 = 2048;
      v40 = v24;
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu reachability events", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(a1[4], "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "delegateCaller");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_53;
    v28[3] = &unk_1E3AB60A0;
    v27 = a1[6];
    v29 = v17;
    v30 = v27;
    v15 = v17;
    objc_msgSend(v26, "invokeBlock:", v28);

  }
}

uint64_t __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_49(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __111__HMCameraRecordingReachabilityEventManager_fetchEventsWithDateInterval_limit_shouldOrderAscending_completion___block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __76__HMCameraRecordingReachabilityEventManager_performCloudPullWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
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

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_53693 != -1)
    dispatch_once(&logCategory__hmf_once_t21_53693, &__block_literal_global_53694);
  return (id)logCategory__hmf_once_v22_53695;
}

void __56__HMCameraRecordingReachabilityEventManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22_53695;
  logCategory__hmf_once_v22_53695 = v0;

}

@end
