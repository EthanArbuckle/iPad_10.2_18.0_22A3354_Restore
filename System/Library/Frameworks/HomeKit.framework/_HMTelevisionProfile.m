@implementation _HMTelevisionProfile

- (_HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _HMTelevisionProfile *v12;
  uint64_t v13;
  NSArray *mediaSourceDisplayOrder;
  objc_super v16;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3A28];
  v8 = a4;
  objc_msgSend(v6, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hm_deriveUUIDFromBaseUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObject:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16.receiver = self;
  v16.super_class = (Class)_HMTelevisionProfile;
  v12 = -[_HMAccessoryProfile initWithUUID:services:](&v16, sel_initWithUUID_services_, v10, v11);
  if (v12)
  {
    objc_msgSend(v6, "mediaSourceDisplayOrder");
    v13 = objc_claimAutoreleasedReturnValue();
    mediaSourceDisplayOrder = v12->_mediaSourceDisplayOrder;
    v12->_mediaSourceDisplayOrder = (NSArray *)v13;

    *(&v12->_mediaSourceDisplayOrderModifiable + 4) = objc_msgSend(v6, "mediaSourceDisplayOrderModifiable");
  }

  return v12;
}

- (void)_registerNotificationHandlers
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[_HMAccessoryProfile context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53___HMTelevisionProfile__registerNotificationHandlers__block_invoke;
  v5[3] = &unk_1E3AB4BF0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "registerForMessage:receiver:messageHandler:", CFSTR("HMTP.sdoUpdated"), self, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (NSArray)mediaSourceDisplayOrder
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSArray copy](self->_mediaSourceDisplayOrder, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setMediaSourceDisplayOrder:(id)a3
{
  NSArray *v4;
  NSArray *mediaSourceDisplayOrder;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock_with_options();
  mediaSourceDisplayOrder = self->_mediaSourceDisplayOrder;
  self->_mediaSourceDisplayOrder = v4;

  os_unfair_lock_unlock(&self->super._lock);
}

- (BOOL)isMediaSourceDisplayOrderModifiable
{
  _HMTelevisionProfile *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->_mediaSourceDisplayOrderModifiable + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (id)messageTargetUUID
{
  void *v2;
  void *v3;

  -[_HMAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[_HMTelevisionProfile messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (id)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[_HMAccessoryProfile context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _HMTelevisionProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _HMTelevisionProfile *v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  void (**v30)(id, void *);
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[_HMAccessoryProfile context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[_HMTelevisionProfile updateMediaSourceDisplayOrder:completionHandler:]", CFSTR("completionHandler"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1A1AC1AAC]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 2112;
      v34 = (const char *)v21;
      _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v26);
  }
  v9 = (void *)v8;
  if (!v8)
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
      v32 = v14;
      v33 = 2080;
      v34 = "-[_HMTelevisionProfile updateMediaSourceDisplayOrder:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 12;
    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v19;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Zero entries in mediaSourceDisplayOrder", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = 3;
LABEL_11:
    objc_msgSend(v15, "hmErrorWithCode:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v20);

    goto LABEL_12;
  }
  objc_msgSend(v9, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke;
  block[3] = &unk_1E3AB4D20;
  block[4] = self;
  v30 = v7;
  v28 = v6;
  v29 = v9;
  dispatch_async(v10, block);

LABEL_12:
}

- (void)_notifyDelegateOfUpdatedSourceDisplayOrder:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _HMTelevisionProfile *v12;

  -[_HMTelevisionProfile delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_HMTelevisionProfile delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HMAccessoryProfile context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCaller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __67___HMTelevisionProfile__notifyDelegateOfUpdatedSourceDisplayOrder___block_invoke;
    v10[3] = &unk_1E3AB5ED8;
    v11 = v6;
    v12 = self;
    v9 = v6;
    objc_msgSend(v8, "invokeBlock:", v10);

  }
}

- (void)_handleSourceDisplayOrderUpdated:(id)a3
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

  v4 = a3;
  -[_HMAccessoryProfile context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingRequests");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeCompletionBlockForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayForKey:", CFSTR("source-display-order"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_HMTelevisionProfile mediaSourceDisplayOrder](self, "mediaSourceDisplayOrder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HMTelevisionProfile setMediaSourceDisplayOrder:](self, "setMediaSourceDisplayOrder:", v8);
  if (v7)
  {
    -[_HMAccessoryProfile context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "delegateCaller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callCompletion:error:", v7, 0);

  }
  else if ((HMFEqualObjects() & 1) == 0)
  {
    -[_HMTelevisionProfile _notifyDelegateOfUpdatedSourceDisplayOrder:](self, "_notifyDelegateOfUpdatedSourceDisplayOrder:", v8);
  }

}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  return *(&self->_mediaSourceDisplayOrderModifiable + 4);
}

- (_HMTelevisionProfileDelegate)delegate
{
  return (_HMTelevisionProfileDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaSourceDisplayOrder, 0);
}

@end
