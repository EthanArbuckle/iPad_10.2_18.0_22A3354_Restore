@implementation HMDPhotoLibraryObserver

- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HMDPhotoLibraryObserver *v15;

  v8 = (objc_class *)MEMORY[0x1E0D286C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithTimeInterval:options:", 4, 86400.0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 4, 2592000.0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, 300.0);
  v15 = -[HMDPhotoLibraryObserver initWithUUID:workQueue:photoLibrary:minorUpdateTimer:majorUpdateTimer:changeDebounceTimer:changeDebounceLimit:](self, "initWithUUID:workQueue:photoLibrary:minorUpdateTimer:majorUpdateTimer:changeDebounceTimer:changeDebounceLimit:", v11, v10, v9, v12, v13, v14, 7200.0);

  return v15;
}

- (HMDPhotoLibraryObserver)initWithUUID:(id)a3 workQueue:(id)a4 photoLibrary:(id)a5 minorUpdateTimer:(id)a6 majorUpdateTimer:(id)a7 changeDebounceTimer:(id)a8 changeDebounceLimit:(double)a9
{
  id v17;
  id v18;
  id v19;
  HMDPhotoLibraryObserver *v20;
  HMDPhotoLibraryObserver *v21;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)HMDPhotoLibraryObserver;
  v20 = -[HMDPhotoLibraryObserver init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v21->_UUID, a3);
    objc_storeStrong((id *)&v21->_photoLibrary, a5);
    objc_storeStrong((id *)&v21->_minorUpdateTimer, a6);
    objc_storeStrong((id *)&v21->_majorUpdateTimer, a7);
    objc_storeStrong((id *)&v21->_changeDebounceTimer, a8);
    v21->_changeDebounceLimit = a9;
  }

  return v21;
}

- (void)configure
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDPhotoLibraryObserver photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDPhotoLibraryObserver minorUpdateTimer](self, "minorUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryObserver minorUpdateTimer](self, "minorUpdateTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegateQueue:", v6);

  -[HMDPhotoLibraryObserver minorUpdateTimer](self, "minorUpdateTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

  -[HMDPhotoLibraryObserver majorUpdateTimer](self, "majorUpdateTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryObserver majorUpdateTimer](self, "majorUpdateTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegateQueue:", v10);

  -[HMDPhotoLibraryObserver majorUpdateTimer](self, "majorUpdateTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  -[HMDPhotoLibraryObserver changeDebounceTimer](self, "changeDebounceTimer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryObserver changeDebounceTimer](self, "changeDebounceTimer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegateQueue:", v15);

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDPhotoLibraryObserver photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[HMDPhotoLibraryObserver minorUpdateTimer](self, "minorUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  -[HMDPhotoLibraryObserver majorUpdateTimer](self, "majorUpdateTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suspend");

  -[HMDPhotoLibraryObserver changeDebounceTimer](self, "changeDebounceTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suspend");

}

- (void)photoLibraryPersonsDidChange
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDPhotoLibraryObserver_photoLibraryPersonsDidChange__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  HMDPhotoLibraryObserver *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDPhotoLibraryObserver *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDPhotoLibraryObserver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPhotoLibraryObserver delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibraryObserver minorUpdateTimer](self, "minorUpdateTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v16;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Minor update timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    goto LABEL_10;
  }
  -[HMDPhotoLibraryObserver majorUpdateTimer](self, "majorUpdateTimer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Major update timer fired", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v6, "observerDidObserveMajorChange:", v18);
  }
  else
  {
    -[HMDPhotoLibraryObserver changeDebounceTimer](self, "changeDebounceTimer");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v4)
    {
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v13;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change debounce timer fired", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
      -[HMDPhotoLibraryObserver setInitiallyDebouncedChangeDate:](v11, "setInitiallyDebouncedChangeDate:", 0);
LABEL_10:
      objc_msgSend(v6, "observerDidObserveMinorChange:", v11);
    }
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDPhotoLibraryObserver UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDPhotoLibraryObserverDelegate)delegate
{
  return (HMDPhotoLibraryObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMDPhotoLibrary)photoLibrary
{
  return (HMDPhotoLibrary *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)minorUpdateTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 40, 1);
}

- (HMFTimer)majorUpdateTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimer)changeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 56, 1);
}

- (double)changeDebounceLimit
{
  return self->_changeDebounceLimit;
}

- (NSDate)initiallyDebouncedChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInitiallyDebouncedChangeDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiallyDebouncedChangeDate, 0);
  objc_storeStrong((id *)&self->_changeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_majorUpdateTimer, 0);
  objc_storeStrong((id *)&self->_minorUpdateTimer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__HMDPhotoLibraryObserver_photoLibraryPersonsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "initiallyDebouncedChangeDate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_6;
  v3 = (void *)v2;
  objc_msgSend(*(id *)(a1 + 32), "initiallyDebouncedChangeDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = -v5;
  objc_msgSend(*(id *)(a1 + 32), "changeDebounceLimit");
  v8 = v7;

  if (v8 < v6)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "initiallyDebouncedChangeDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change; handling change immediately since we've been debouncing since %@",
        (uint8_t *)&v21,
        0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(*(id *)(a1 + 32), "changeDebounceTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fire");
  }
  else
  {
LABEL_6:
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Photo library persons did change; resuming debounce timer",
        (uint8_t *)&v21,
        0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(*(id *)(a1 + 32), "initiallyDebouncedChangeDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setInitiallyDebouncedChangeDate:", v20);

    }
    objc_msgSend(*(id *)(a1 + 32), "changeDebounceTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_66311 != -1)
    dispatch_once(&logCategory__hmf_once_t5_66311, &__block_literal_global_66312);
  return (id)logCategory__hmf_once_v6_66313;
}

void __38__HMDPhotoLibraryObserver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_66313;
  logCategory__hmf_once_v6_66313 = v0;

}

@end
