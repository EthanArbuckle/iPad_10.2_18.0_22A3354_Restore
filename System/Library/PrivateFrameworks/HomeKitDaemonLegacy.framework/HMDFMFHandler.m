@implementation HMDFMFHandler

- (HMDFMFHandler)init
{
  HMDFMFHandler *v2;
  HMDFMFHandler *v3;
  uint64_t v4;
  HMDFMF *fmfStatus;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSMutableArray *queries;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v14;
  void *v15;
  HMDFMFHandler *v16;
  NSObject *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)HMDFMFHandler;
  v2 = -[HMDFMFHandler init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    +[HMDFMF fmfStatusWithValue:](HMDFMF, "fmfStatusWithValue:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    fmfStatus = v3->_fmfStatus;
    v3->_fmfStatus = (HMDFMF *)v4;

    v6 = (const char *)HMFDispatchQueueName();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    queries = v3->_queries;
    v3->_queries = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v3, sel_homeDataLoaded_, CFSTR("HMDHomeManagerHomeDataLoadedNotification"), 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)meDeviceChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E0D20250], 0, CFNotificationSuspensionBehaviorCoalesce);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, 0, (CFNotificationCallback)fmfDevicesChangedNotificationCallback, (CFStringRef)*MEMORY[0x1E0D20248], 0, CFNotificationSuspensionBehaviorCoalesce);
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = v3;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Created FMF Handler", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }
  return v3;
}

- (HMDFMF)fmfStatus
{
  os_unfair_lock_s *p_lock;
  HMDFMF *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_fmfStatus;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setFmfStatus:(id)a3
{
  HMDFMF *v4;
  HMDFMF *fmfStatus;

  v4 = (HMDFMF *)a3;
  os_unfair_lock_lock_with_options();
  fmfStatus = self->_fmfStatus;
  self->_fmfStatus = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)homeDataLoaded:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDFMFHandler workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMDFMFHandler_homeDataLoaded___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)meDeviceChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDFMFHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__HMDFMFHandler_meDeviceChanged__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)fmfDevicesChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDFMFHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HMDFMFHandler_fmfDevicesChanged__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_initiateFMFRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDFMFHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMDFMFRequest *v10;
  void *v11;
  HMDFMFRequest *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  HMDFMFRequest *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HMDFMFHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDFMFHandler currentFMFRequest](self, "currentFMFRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDFMFHandler currentFMFRequest](v6, "currentFMFRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@FMF query / session in already in place. Not submitting another one. Multiple instances of FMFSession is not recommended : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v10 = -[HMDFMFRequest initWithResponseTimerDelegate:]([HMDFMFRequest alloc], "initWithResponseTimerDelegate:", self);
    objc_initWeak((id *)buf, self);
    -[HMDFMFRequest fmfSession](v10, "fmfSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __36__HMDFMFHandler__initiateFMFRequest__block_invoke;
    v18 = &unk_1E89B4120;
    objc_copyWeak(&v20, (id *)buf);
    v12 = v10;
    v19 = v12;
    objc_msgSend(v11, "getAllDevices:", &v15);

    -[HMDFMFHandler setCurrentFMFRequest:](self, "setCurrentFMFRequest:", v12, v15, v16, v17, v18);
    -[HMDFMFHandler currentFMFRequest](self, "currentFMFRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fmfSessionResponseTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);

  }
}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDFMFHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__HMDFMFHandler_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_processDevices:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  HMDFMFHandler *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDFMFHandler *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  HMDFMFHandler *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDFMFHandler workQueue](self, "workQueue");
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
    -[HMDFMFHandler currentFMFRequest](v10, "currentFMFRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543618;
    v31 = v12;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Resetting the current %@", (uint8_t *)&v30, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v14 = -[HMDFMFHandler setCurrentFMFRequest:](v10, "setCurrentFMFRequest:", 0);
  if (v6)
  {
    +[HMDFMF fmfStatusWithValue:](HMDFMF, "fmfStatusWithValue:", -[HMDFMFHandler _computeFMFStatus:](v10, "_computeFMFStatus:", v6));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFMFHandler _respondToPendingRequests:](v10, "_respondToPendingRequests:", v15);
    -[HMDFMFHandler fmfStatus](v10, "fmfStatus");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = HMFEqualObjects();

    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = v10;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if ((v17 & 1) != 0)
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDFMFHandler fmfStatus](v19, "fmfStatus");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@FMF status is not changing from %@", (uint8_t *)&v30, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    else
    {
      if (v21)
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDFMFHandler fmfStatus](v19, "fmfStatus");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v28;
        v32 = 2112;
        v33 = v29;
        v34 = 2112;
        v35 = v15;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@FMF status is changing from %@ to %@", (uint8_t *)&v30, 0x20u);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDFMFHandler setFmfStatus:](v19, "setFmfStatus:", v15);
      -[HMDFMFHandler sendNotification](v19, "sendNotification");
    }
  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0](v14);
    v25 = v10;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v27;
      v32 = 2112;
      v33 = v7;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Process request failed: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
    -[HMDFMFHandler fmfStatus](v25, "fmfStatus");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFMFHandler _respondToPendingRequests:](v25, "_respondToPendingRequests:", v15);
  }

}

- (unint64_t)_computeFMFStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDFMFHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  HMDFMFHandler *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  HMDFMFHandler *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = self;
  -[HMDFMFHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    if (v7)
    {
      v8 = v7;
      v27 = v4;
      v9 = 0;
      v10 = *(_QWORD *)v33;
      v28 = *(_QWORD *)v33;
      v29 = v6;
      while (2)
      {
        v11 = 0;
        v30 = v8;
        do
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D17BA0A0]();
          v14 = v31;
          HMFGetOSLogHandle();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "isThisDevice");
            HMFBooleanToString();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "isCompanionDevice");
            HMFBooleanToString();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "isActiveDevice");
            HMFBooleanToString();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v37 = v16;
            v38 = 2112;
            v39 = v12;
            v40 = 2112;
            v41 = v17;
            v42 = 2112;
            v43 = v18;
            v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@device: %@, isThisDevice: %@, isCompanionDevice: %@, isActiveDevice: %@", buf, 0x34u);

            v8 = v30;
            v10 = v28;

            v6 = v29;
          }

          objc_autoreleasePoolPop(v13);
          if (objc_msgSend(v12, "isThisDevice") && (objc_msgSend(v12, "isActiveDevice") & 1) != 0)
          {

            v20 = 2;
            goto LABEL_20;
          }
          v9 |= objc_msgSend(v12, "isActiveDevice");
          ++v11;
        }
        while (v8 != v11);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
        if (v8)
          continue;
        break;
      }

      if ((v9 & 1) != 0)
        v20 = 3;
      else
        v20 = 1;
LABEL_20:
      v4 = v27;
    }
    else
    {

      v20 = 1;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17BA0A0]();
    v22 = v31;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = v4;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v25;
      _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_INFO, "%{public}@FMF is reporting no devices", buf, 0xCu);

      v4 = v24;
    }

    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  return v20;
}

- (void)queryFMFStatusWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  HMDFMFHandler *v12;
  SEL v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      -[HMDFMFHandler workQueue](self, "workQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke;
      block[3] = &unk_1E89C1B48;
      block[4] = self;
      v16 = v6;
      v17 = v8;
      v10 = v8;
      v11 = v6;
      dispatch_async(v9, block);

      return;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v12 = (HMDFMFHandler *)_HMFPreconditionFailure();
  -[HMDFMFHandler queryFMFStatusWithCompletion:](v12, v13, v14);
}

- (void)queryFMFStatusWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDFMFHandler workQueue](self, "workQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDFMFHandler queryFMFStatusWithQueue:completion:](self, "queryFMFStatusWithQueue:completion:", v5, v4);

}

- (void)_respondToPendingRequests:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  HMDFMFHandler *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id obj;
  _QWORD block[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDFMFHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDFMFHandler queries](self, "queries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1D17BA0A0]();
        v12 = self;
        HMFGetOSLogHandle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v25 = v14;
          v26 = 2112;
          v27 = v10;
          v28 = 2112;
          v29 = v4;
          _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Responding to %@ with status %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v10, "responseQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__HMDFMFHandler__respondToPendingRequests___block_invoke;
        block[3] = &unk_1E89C2328;
        block[4] = v10;
        v19 = v4;
        dispatch_async(v15, block);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v7);
  }

  -[HMDFMFHandler queries](self, "queries");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

}

- (void)sendNotification
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDFMFHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDFMFHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDFMFHandler fmfStatus](self, "fmfStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addToPayload:", v4);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDFMFHandler fmfStatus](v7, "fmfStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Sending FMF status update notification %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("HMDFMFStatusUpdateNotification"), v7, v12);

}

- (BOOL)isThisDesignatedFMFDevice
{
  void *v2;
  BOOL v3;

  -[HMDFMFHandler fmfStatus](self, "fmfStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "value") == 2;

  return v3;
}

- (HMDFMFRequest)currentFMFRequest
{
  return self->_currentFMFRequest;
}

- (void)setCurrentFMFRequest:(id)a3
{
  objc_storeStrong((id *)&self->_currentFMFRequest, a3);
}

- (NSMutableArray)queries
{
  return self->_queries;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_currentFMFRequest, 0);
  objc_storeStrong((id *)&self->_fmfStatus, 0);
}

void __43__HMDFMFHandler__respondToPendingRequests___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completion");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

void __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  HMDFMFQuery *v5;
  HMDFMFQuery *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  HMDFMFQuery *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  HMDFMFQuery *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fmfStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "value");

  if (v3)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke_62;
    v12[3] = &unk_1E89C1D68;
    v4 = *(NSObject **)(a1 + 40);
    v5 = (HMDFMFQuery *)*(id *)(a1 + 48);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    dispatch_async(v4, v12);
    v6 = v13;
  }
  else
  {
    v6 = -[HMDFMFQuery initWithResponseQueue:completion:]([HMDFMFQuery alloc], "initWithResponseQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@FMF status is still unknown querying FMF, adding query %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "queries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "_initiateFMFRequest");
  }

}

void __52__HMDFMFHandler_queryFMFStatusWithQueue_completion___block_invoke_62(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "fmfStatus");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __30__HMDFMFHandler_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentFMFRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fmfSessionResponseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_processDevices:error:", 0);

  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@FMFRequest timer doesnt match, ignorning", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

void __36__HMDFMFHandler__initiateFMFRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __36__HMDFMFHandler__initiateFMFRequest__block_invoke_2;
    v10[3] = &unk_1E89C07B8;
    v10[4] = v8;
    v11 = *(id *)(a1 + 32);
    v12 = v5;
    v13 = v6;
    dispatch_async(v9, v10);

  }
}

void __36__HMDFMFHandler__initiateFMFRequest__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentFMFRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processDevices:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "currentFMFRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Current FMF request: %@ does not match this request %@, ignoring the response", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __34__HMDFMFHandler_fmfDevicesChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Devices have changed, initiating FMF request", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_initiateFMFRequest");
}

uint64_t __32__HMDFMFHandler_meDeviceChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@FMF Designated device has changed, initiating FMF request", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_initiateFMFRequest");
}

uint64_t __32__HMDFMFHandler_homeDataLoaded___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Home data has been loaded, initiating FMF request", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_initiateFMFRequest");
}

+ (HMDFMFHandler)sharedHandler
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HMDFMFHandler_sharedHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedHandler_onceToken_115282 != -1)
    dispatch_once(&sharedHandler_onceToken_115282, block);
  return (HMDFMFHandler *)(id)sharedHandler_sharedHandler;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18_115277 != -1)
    dispatch_once(&logCategory__hmf_once_t18_115277, &__block_literal_global_115278);
  return (id)logCategory__hmf_once_v19_115279;
}

void __28__HMDFMFHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v19_115279;
  logCategory__hmf_once_v19_115279 = v0;

}

void __30__HMDFMFHandler_sharedHandler__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedHandler_sharedHandler;
  sharedHandler_sharedHandler = (uint64_t)v1;

}

@end
