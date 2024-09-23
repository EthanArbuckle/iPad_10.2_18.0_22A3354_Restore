@implementation _HMCameraSnapshotControl

- (_HMCameraSnapshotControl)initWithCameraProfile:(id)a3 profileUniqueIdentifier:(id)a4 mostRecentSnapshot:(id)a5
{
  id v8;
  _HMCameraSnapshotControl *v9;
  _HMCameraSnapshotControl *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_HMCameraSnapshotControl;
  v9 = -[_HMCameraControl initWithCameraProfile:profileUniqueIdentifier:](&v12, sel_initWithCameraProfile_profileUniqueIdentifier_, a3, a4);
  v10 = v9;
  if (v8 && v9)
    -[_HMCameraSnapshotControl _handleMostRecentSnapshot:](v9, "_handleMostRecentSnapshot:", v8);

  return v10;
}

- (void)_takeSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _HMCameraSnapshotControl *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _HMCameraSnapshotControl *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[_HMCameraControl context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v6 = objc_alloc(MEMORY[0x1E0D285F8]);
    v7 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);
    v26 = CFSTR("kCameraSessionID");
    v27 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v6, "initWithName:destination:payload:", CFSTR("HMCameraSnapshotTakeSnapshotMessage"), v9, v10);

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41___HMCameraSnapshotControl__takeSnapshot__block_invoke;
    v22[3] = &unk_1E3AB35B8;
    objc_copyWeak(&v24, &location);
    v12 = v5;
    v23 = v12;
    v13 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v11, "setResponseHandler:", v22));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      v30 = 2112;
      v31 = (const char *)v12;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Sending take snapshot message with session ID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(v3, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:", v11);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v21;
      v30 = 2080;
      v31 = "-[_HMCameraSnapshotControl _takeSnapshot]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)__configureWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _HMCameraSnapshotControl *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_HMCameraSnapshotControl;
  -[_HMCameraControl __configureWithContext:](&v14, sel___configureWithContext_, v4);
  -[_HMCameraSnapshotControl mostRecentSnapshot](self, "mostRecentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HMCameraSnapshotControl mostRecentSnapshot](v7, "mostRecentSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Initializing with most recent snapshot: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[_HMCameraSnapshotControl mostRecentSnapshot](v7, "mostRecentSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContext:", v4);

  }
  -[_HMCameraControl context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerForMessage:receiver:selector:", CFSTR("HMCameraSnapshotMostRecentSnapshotUpdatedMessage"), self, sel__handleMostRecentSnapshotUpdatedMessage_);

}

- (HMCameraSnapshot)mostRecentSnapshot
{
  os_unfair_lock_s *p_lock;
  HMCameraSnapshot *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_mostRecentSnapshot;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)takeSnapshot
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _HMCameraSnapshotControl *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[_HMCameraControl context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40___HMCameraSnapshotControl_takeSnapshot__block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = self;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2080;
      v14 = "-[_HMCameraSnapshotControl takeSnapshot]";
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Nil context - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->super._lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_handleSnapshot:(id)a3 error:(id)a4 isMostRecent:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _HMCameraSnapshotControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  _HMCameraSnapshotControl *v21;
  NSObject *v22;
  void *v23;
  HMCameraSnapshot *v24;
  void *v25;
  HMCameraSnapshot *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v13;
      v31 = 2112;
      v32 = v9;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Received error handling snapshot: %@", (uint8_t *)&v29, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[_HMCameraSnapshotControl _notifyDelegateOfDidTakeSnapshot:error:](v11, "_notifyDelegateOfDidTakeSnapshot:error:", 0, v9);
  }
  else
  {
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kSlotIdentifierKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_dateForKey:", CFSTR("kSnapshotCaptureDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kSourceAspectRatioKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && (-[_HMCameraSnapshotControl mostRecentSnapshot](self, "mostRecentSnapshot"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v17, "slotIdentifier"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = HMFEqualObjects(),
          v18,
          v17,
          v19))
    {
      v20 = (void *)MEMORY[0x1A1AC1AAC]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138543362;
        v30 = v23;
        _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Most recent snapshot is already equal", (uint8_t *)&v29, 0xCu);

      }
      objc_autoreleasePoolPop(v20);
    }
    else
    {
      v24 = [HMCameraSnapshot alloc];
      -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMCameraSnapshot initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:](v24, "initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:", v25, v14, v16, v15);

      -[_HMCameraControl context](self, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraSource setContext:](v26, "setContext:", v27);

      -[_HMCameraSnapshotControl setMostRecentSnapshot:](self, "setMostRecentSnapshot:", v26);
      if (v5)
      {
        -[_HMCameraSnapshotControl _notifyDelegateOfMostRecentSnapshotUpdated](self, "_notifyDelegateOfMostRecentSnapshotUpdated");
      }
      else
      {
        -[_HMCameraSnapshotControl mostRecentSnapshot](self, "mostRecentSnapshot");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HMCameraSnapshotControl _notifyDelegateOfDidTakeSnapshot:error:](self, "_notifyDelegateOfDidTakeSnapshot:error:", v28, 0);

      }
    }

  }
}

- (void)_notifyDelegateOfDidTakeSnapshot:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _HMCameraSnapshotControl *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_HMCameraSnapshotControl delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMCameraControl context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegateCaller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67___HMCameraSnapshotControl__notifyDelegateOfDidTakeSnapshot_error___block_invoke;
    v11[3] = &unk_1E3AB59E8;
    v12 = v8;
    v13 = self;
    v14 = v6;
    v15 = v7;
    objc_msgSend(v10, "invokeBlock:", v11);

  }
}

- (_HMCameraSnapshotControlDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (_HMCameraSnapshotControlDelegate *)WeakRetained;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t20 != -1)
    dispatch_once(&logCategory__hmf_once_t20, &__block_literal_global_5768);
  return (id)logCategory__hmf_once_v21;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mostRecentSnapshot, 0);
}

- (void)setMostRecentSnapshot:(id)a3
{
  HMCameraSnapshot *v4;
  HMCameraSnapshot *mostRecentSnapshot;

  v4 = (HMCameraSnapshot *)a3;
  os_unfair_lock_lock_with_options();
  mostRecentSnapshot = self->_mostRecentSnapshot;
  self->_mostRecentSnapshot = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (void)fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _HMCameraSnapshotControl *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _HMCameraSnapshotControl *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMCameraControl context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMCameraSnapshotControl fetchCameraSnapshotForBulletinContext:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84___HMCameraSnapshotControl_fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
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
      v26 = v14;
      v27 = 2080;
      v28 = "-[_HMCameraSnapshotControl fetchCameraSnapshotForBulletinContext:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v15);

  }
}

- (void)mergeNewSnapshotControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  _HMCameraSnapshotControl *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "mostRecentSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraSnapshotControl mostRecentSnapshot](self, "mostRecentSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "slotIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = HMFEqualObjects();

  if ((v9 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating most recent snapshot to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[_HMCameraControl context](v11, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContext:", v14);

    -[_HMCameraSnapshotControl setMostRecentSnapshot:](v11, "setMostRecentSnapshot:", v5);
    -[_HMCameraControl context](v11, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52___HMCameraSnapshotControl_mergeNewSnapshotControl___block_invoke;
    block[3] = &unk_1E3AB5E18;
    block[4] = v11;
    dispatch_async(v16, block);

  }
}

- (void)_fetchCameraSnapshotForBulletinContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _HMCameraSnapshotControl *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _HMCameraSnapshotControl *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _HMCameraSnapshotControl *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _HMCameraSnapshotControl *v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  const char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[_HMCameraControl context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMCameraSnapshotControl _fetchCameraSnapshotForBulletinContext:completionHandler:]", CFSTR("completion"));
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1A1AC1AAC]();
    v37 = self;
    HMFGetOSLogHandle();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v39;
      v50 = 2112;
      v51 = (const char *)v35;
      _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v36);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v35, 0);
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v40);
  }
  v9 = (void *)v8;
  if (v8)
  {
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kCameraSessionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kSnapshotFilePath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dateForKey:", CFSTR("kSnapshotCaptureDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10 && v11 && v12)
    {
      v43 = v9;
      v41 = v7;
      v14 = objc_alloc(MEMORY[0x1E0D285F8]);
      v42 = v6;
      v15 = objc_alloc(MEMORY[0x1E0D285D8]);
      -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);
      v46[0] = CFSTR("kCameraSessionID");
      v46[1] = CFSTR("kSnapshotFilePath");
      v47[0] = v10;
      v47[1] = v11;
      v46[2] = CFSTR("kSnapshotCaptureDate");
      v47[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v14;
      v7 = v41;
      v20 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", CFSTR("HMCameraSnapshotCreateSnapshotFromBulletinContextMessage"), v17, v18);

      v6 = v42;
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __85___HMCameraSnapshotControl__fetchCameraSnapshotForBulletinContext_completionHandler___block_invoke;
      v44[3] = &unk_1E3AB59B8;
      v44[4] = self;
      v45 = v41;
      v21 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v20, "setResponseHandler:", v44));
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v24;
        v50 = 2112;
        v51 = (const char *)v42;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Sending create snapshot message for bulletin context: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v43, "messageDispatcher");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sendMessage:", v20);

      v9 = v43;
    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      v31 = self;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v33;
        v50 = 2112;
        v51 = (const char *)v6;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch camera snapshot for bulletin context: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v9, "delegateCaller");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "callCompletion:error:snapshot:", v7, v34, 0);

    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v29;
      v50 = 2080;
      v51 = "-[_HMCameraSnapshotControl _fetchCameraSnapshotForBulletinContext:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
  }

}

- (void)_handleMostRecentSnapshot:(id)a3
{
  -[_HMCameraSnapshotControl _handleSnapshot:error:isMostRecent:](self, "_handleSnapshot:error:isMostRecent:", a3, 0, 1);
}

- (void)_notifyDelegateOfMostRecentSnapshotUpdated
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _HMCameraSnapshotControl *v10;

  -[_HMCameraSnapshotControl delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE434B40))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_HMCameraControl context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "delegateCaller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70___HMCameraSnapshotControl__notifyDelegateOfMostRecentSnapshotUpdated__block_invoke;
    v8[3] = &unk_1E3AB5ED8;
    v9 = v5;
    v10 = self;
    objc_msgSend(v7, "invokeBlock:", v8);

  }
}

- (void)_handleCreateSnapshotWithBulletinContext:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8;
  HMCameraSnapshot *v9;
  void *v10;
  void *v11;
  void *v12;
  HMCameraSnapshot *v13;
  void *v14;
  HMCameraSnapshot *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v8 = a4;
  v9 = (HMCameraSnapshot *)a5;
  if (v8)
  {
    -[_HMCameraControl context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmPublicError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:snapshot:", v9, v12, 0);
  }
  else
  {
    objc_msgSend(v19, "hmf_numberForKey:", CFSTR("kSlotIdentifierKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hmf_dateForKey:", CFSTR("kSnapshotCaptureDate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hmf_numberForKey:", CFSTR("kSourceAspectRatioKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [HMCameraSnapshot alloc];
    -[_HMCameraControl profileUniqueIdentifier](self, "profileUniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HMCameraSnapshot initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:](v13, "initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:captureDate:", v14, v10, v12, v11);

    -[_HMCameraControl context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMCameraSource setContext:](v15, "setContext:", v16);

    -[_HMCameraControl context](self, "context");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegateCaller");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "callCompletion:error:snapshot:", v9, 0, v15);

    v9 = v15;
  }

}

- (void)_handleMostRecentSnapshotUpdatedMessage:(id)a3
{
  id v4;
  void *v5;
  _HMCameraSnapshotControl *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
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
    objc_msgSend(v4, "messagePayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Received most recent snapshot updated message payload: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMCameraSnapshotControl _handleMostRecentSnapshot:](v6, "_handleMostRecentSnapshot:", v10);

}

@end
