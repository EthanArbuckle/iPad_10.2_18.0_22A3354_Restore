@implementation HMCameraRecordingEventManager

- (HMCameraRecordingEventManager)initWithContext:(id)a3 clipManager:(id)a4 reachabilityEventManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HMCameraRecordingEventManager *v13;
  HMCameraRecordingEventManager *v14;
  uint64_t v15;
  NSMapTable *delegateCallersByObservers;
  HMCameraProfile *v18;
  SEL v19;
  id v20;
  objc_super v21;

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
    v18 = (HMCameraProfile *)_HMFPreconditionFailure();
    return (HMCameraRecordingEventManager *)-[HMCameraProfile initWithCameraProfile:](v18, v19, v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)HMCameraRecordingEventManager;
  v13 = -[HMCameraRecordingEventManager init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v14->_clipManager, a4);
    objc_storeStrong((id *)&v14->_reachabilityEventManager, a5);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    delegateCallersByObservers = v14->_delegateCallersByObservers;
    v14->_delegateCallersByObservers = (NSMapTable *)v15;

  }
  return v14;
}

- (void)addObserver:(id)a3
{
  -[HMCameraRecordingEventManager addObserver:queue:](self, "addObserver:queue:", a3, 0);
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  HMDelegateCaller *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    v7 = -[HMDelegateCaller initWithQueue:]([HMDelegateCaller alloc], "initWithQueue:", v6);
  }
  else
  {
    -[HMCameraRecordingEventManager context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "delegateCaller");
    v7 = (HMDelegateCaller *)objc_claimAutoreleasedReturnValue();

  }
  -[HMCameraRecordingEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v12);

  os_unfair_lock_unlock(&self->_lock);
  -[HMCameraRecordingEventManager clipManager](self, "clipManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:queue:", self, v6);

  -[HMCameraRecordingEventManager reachabilityEventManager](self, "reachabilityEventManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:queue:", self, v6);

}

- (void)removeObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock_with_options();
  -[HMCameraRecordingEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[HMCameraRecordingEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v11);

  -[HMCameraRecordingEventManager delegateCallersByObservers](self, "delegateCallersByObservers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  os_unfair_lock_unlock(&self->_lock);
  if (!v8 && v5)
  {
    -[HMCameraRecordingEventManager clipManager](self, "clipManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", self);

    -[HMCameraRecordingEventManager reachabilityEventManager](self, "reachabilityEventManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:", self);

  }
}

- (void)performCloudPullWithCompletion:(id)a3
{
  id v4;
  void *v5;
  HMCameraRecordingEventManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
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
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Performing cloud pull", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMCameraRecordingEventManager clipManager](v6, "clipManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performCloudPullWithCompletion:", v4);

}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  -[HMCameraRecordingEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", a3, a4, 1, a5);
}

- (void)fetchEventsWithDateInterval:(id)a3 limit:(unint64_t)a4 shouldOrderAscending:(BOOL)a5 completion:(id)a6
{
  -[HMCameraRecordingEventManager fetchEventsWithDateInterval:quality:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:quality:limit:shouldOrderAscending:completion:", a3, 0, a4, a5, a6);
}

- (void)fetchEventsWithDateInterval:(id)a3 quality:(int64_t)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMCameraRecordingEventManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  _BOOL8 v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  unint64_t v36;
  BOOL v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  unint64_t v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v8 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch recording events with date interval"));
  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = v12;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v29 = v15;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "shortDescription");
    v30 = v13;
    v20 = a5;
    v21 = v8;
    v22 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HMStringFromCameraClipQuality(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v39 = v18;
    v40 = 2114;
    v41 = v23;
    v42 = 2112;
    v43 = v31;
    v44 = 2112;
    v45 = v24;
    v46 = 2048;
    v47 = v20;
    v48 = 1024;
    v49 = v21;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching recording events with date interval: %@ quality: %@ limit: %lu shouldOrderAscending: %d", buf, 0x3Au);

    a4 = v22;
    v8 = v21;
    a5 = v20;
    v13 = v30;

    v15 = v29;
    v12 = v31;
  }

  objc_autoreleasePoolPop(v15);
  -[HMCameraRecordingEventManager clipManager](v16, "clipManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke;
  v32[3] = &unk_1E3AAEE38;
  v32[4] = v16;
  v33 = v14;
  v34 = v12;
  v35 = v13;
  v36 = a5;
  v37 = v8;
  v26 = v12;
  v27 = v14;
  v28 = v13;
  objc_msgSend(v25, "fetchClipsWithDateInterval:quality:limit:shouldOrderAscending:completion:", v26, a4, a5, v8, v32);

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
  v10[2] = __62__HMCameraRecordingEventManager_fetchAllEventsWithCompletion___block_invoke;
  v10[3] = &unk_1E3AB5990;
  v11 = v4;
  v9 = v4;
  -[HMCameraRecordingEventManager fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:](self, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", v8, -1, 1, v10);

}

- (void)fetchCountOfEventsWithDateInterval:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMCameraRecordingEventManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("Fetch count of recording events with date interval"));
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
    v24 = v12;
    v25 = 2114;
    v26 = v14;
    v27 = 2112;
    v28 = v6;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching count of recording events with date interval %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  -[HMCameraRecordingEventManager clipManager](v10, "clipManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke;
  v19[3] = &unk_1E3AAEE60;
  v19[4] = v10;
  v20 = v8;
  v21 = v6;
  v22 = v7;
  v16 = v6;
  v17 = v8;
  v18 = v7;
  objc_msgSend(v15, "fetchCountOfClipsWithDateInterval:completion:", v16, v19);

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

  -[HMCameraRecordingEventManager fetchCountOfEventsWithDateInterval:completion:](self, "fetchCountOfEventsWithDateInterval:completion:", v9, v5);
}

- (void)deleteAllEventsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  HMCameraRecordingEventManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
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
    v14 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Deleting all recording events", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMCameraRecordingEventManager clipManager](v6, "clipManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E3AB5380;
  v11[4] = v6;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v9, "deleteAllClipsWithCompletionHandler:", v11);

}

- (id)mergedRecordingEventsWithRecordingEvents1:(id)a3 recordingEvents2:(id)a4 limit:(unint64_t)a5 shouldOrderAscending:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v26 = v9;
  objc_msgSend(v9, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  objc_msgSend(v10, "objectEnumerator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v13 = -1;
  else
    v13 = 1;
  objc_msgSend(v11, "nextObject");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  while (v14 | v15)
  {
    if (objc_msgSend(v16, "count") >= a5)
      goto LABEL_16;
    if (v14 != 0 && v15 != 0)
    {
      objc_msgSend((id)v15, "dateOfOccurrence");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v14, "dateOfOccurrence");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "compare:", v18);

      if (v19 != v13)
        goto LABEL_11;
      objc_msgSend(v16, "addObject:", v15);
      objc_msgSend(v12, "nextObject");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14)
      {
LABEL_11:
        objc_msgSend(v16, "addObject:", v14);
        objc_msgSend(v11, "nextObject");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v14;
        v14 = v21;
        goto LABEL_14;
      }
      objc_msgSend(v16, "addObject:", v15);
      objc_msgSend(v12, "nextObject");
      v20 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
    }
    v22 = (void *)v15;
    v15 = v20;
LABEL_14:

  }
  v14 = 0;
  v15 = 0;
LABEL_16:
  v23 = (void *)objc_msgSend(v16, "copy");

  return v23;
}

- (void)notifyObserversOfUpdatedEvents:(id)a3 removedEventsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  id obj;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  HMCameraRecordingEventManager *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  v8 = (void *)-[NSMapTable copy](self->_delegateCallersByObservers, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v8, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __87__HMCameraRecordingEventManager_notifyObserversOfUpdatedEvents_removedEventsWithUUIDs___block_invoke;
        v15[3] = &unk_1E3AB59E8;
        v16 = v6;
        v17 = v12;
        v18 = self;
        v19 = v7;
        objc_msgSend(v13, "invokeBlock:", v15);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

}

- (void)clipManager:(id)a3 didUpdateClips:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCameraRecordingEventManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2048;
    v16 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated clips", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingEventManager notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:](v9, "notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:", v7, v12);

}

- (void)clipManager:(id)a3 didRemoveClipsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCameraRecordingEventManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2048;
    v16 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed clip UUIDs", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingEventManager notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:](v9, "notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:", v12, v7);

}

- (void)reachabilityEventManager:(id)a3 didUpdateReachabilityEvents:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCameraRecordingEventManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2048;
    v16 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu updated reachability events", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingEventManager notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:](v9, "notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:", v7, v12);

}

- (void)reachabilityEventManager:(id)a3 didRemoveReachabilityEventsWithUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMCameraRecordingEventManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2048;
    v16 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Received %lu removed reachability event UUIDs", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraRecordingEventManager notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:](v9, "notifyObserversOfUpdatedEvents:removedEventsWithUUIDs:", v12, v7);

}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 16, 1);
}

- (HMCameraRecordingReachabilityEventManager)reachabilityEventManager
{
  return (HMCameraRecordingReachabilityEventManager *)objc_getProperty(self, a2, 24, 1);
}

- (HMCameraClipManager)clipManager
{
  return (HMCameraClipManager *)objc_getProperty(self, a2, 32, 1);
}

- (NSMapTable)delegateCallersByObservers
{
  return (NSMapTable *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallersByObservers, 0);
  objc_storeStrong((id *)&self->_clipManager, 0);
  objc_storeStrong((id *)&self->_reachabilityEventManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __87__HMCameraRecordingEventManager_notifyObserversOfUpdatedEvents_removedEventsWithUUIDs___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
    objc_msgSend(*(id *)(a1 + 40), "recordingEventManager:didUpdateRecordingEvents:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  result = objc_msgSend(*(id *)(a1 + 56), "count");
  if (result)
    return objc_msgSend(*(id *)(a1 + 40), "recordingEventManager:didRemoveRecordingEventsWithUUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegateCaller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callCompletion:error:", *(_QWORD *)(a1 + 40), v3);

  }
  else
  {
    objc_msgSend(v4, "reachabilityEventManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E3AB5380;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v7, "deleteAllEventsWithCompletionHandler:", v9);

  }
}

void __70__HMCameraRecordingEventManager_deleteAllEventsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "context");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callCompletion:error:", *(_QWORD *)(a1 + 40), v4);

}

void __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ clips", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "reachabilityEventManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_16;
    v17[3] = &unk_1E3AAEE60;
    v17[4] = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    v20 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 40);
    v19 = v5;
    objc_msgSend(v13, "fetchCountOfEventsWithDateInterval:completion:", v14, v17);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), 0, v6);

  }
}

void __79__HMCameraRecordingEventManager_fetchCountOfEventsWithDateInterval_completion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543874;
      v22 = v10;
      v23 = 2114;
      v24 = v12;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched count of %@ reachability events", (uint8_t *)&v21, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = objc_msgSend(*(id *)(a1 + 48), "unsignedIntegerValue");
    v14 = objc_msgSend(v5, "unsignedIntegerValue") + v13;
    objc_msgSend(*(id *)(a1 + 32), "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "delegateCaller");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "callCompletion:obj:error:", v17, v18, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), 0, v6);

  }
}

void __62__HMCameraRecordingEventManager_fetchAllEventsWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

void __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v10;
      v29 = 2114;
      v30 = v12;
      v31 = 2048;
      v32 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu clips", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "reachabilityEventManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(a1 + 72);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke_9;
    v21[3] = &unk_1E3AAEE38;
    v21[4] = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 64);
    v24 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 40);
    v17 = v5;
    v18 = *(_QWORD *)(a1 + 64);
    v23 = v17;
    v25 = v18;
    v26 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v13, "fetchEventsWithDateInterval:limit:shouldOrderAscending:completion:", v15, v16, v14, v21);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "delegateCaller");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), 0, v6);

  }
}

void __107__HMCameraRecordingEventManager_fetchEventsWithDateInterval_quality_limit_shouldOrderAscending_completion___block_invoke_9(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A1AC1AAC]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v10;
      v18 = 2114;
      v19 = v12;
      v20 = 2048;
      v21 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Successfully fetched %lu reachability events", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "mergedRecordingEventsWithRecordingEvents1:recordingEvents2:limit:shouldOrderAscending:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegateCaller");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), v13, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "delegateCaller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "callCompletion:obj:error:", *(_QWORD *)(a1 + 56), 0, v6);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15_12321 != -1)
    dispatch_once(&logCategory__hmf_once_t15_12321, &__block_literal_global_12322);
  return (id)logCategory__hmf_once_v16_12323;
}

void __44__HMCameraRecordingEventManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16_12323;
  logCategory__hmf_once_v16_12323 = v0;

}

@end
