@implementation HMDAccessoryRetrievalCompletionTuple

- (int64_t)linkType
{
  return self->_linkType;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)stop
{
  void *v3;
  NSObject *v4;
  void *v5;

  -[HMDAccessoryRetrievalCompletionTuple home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDAccessoryRetrievalCompletionTuple timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspend");

  -[HMDAccessoryRetrievalCompletionTuple setTimer:](self, "setTimer:", 0);
}

- (void)start
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[HMDAccessoryRetrievalCompletionTuple home](self, "home");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDAccessoryRetrievalCompletionTuple timer](self, "timer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D286C8]);
    -[HMDAccessoryRetrievalCompletionTuple retrievalTimeout](self, "retrievalTimeout");
    v6 = (void *)objc_msgSend(v5, "initWithTimeInterval:options:", 0);
    -[HMDAccessoryRetrievalCompletionTuple setTimer:](self, "setTimer:", v6);

    objc_msgSend(v11, "workQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryRetrievalCompletionTuple timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegateQueue:", v7);

    -[HMDAccessoryRetrievalCompletionTuple timer](self, "timer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[HMDAccessoryRetrievalCompletionTuple timer](self, "timer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resume");

  }
}

- (HMFTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (double)retrievalTimeout
{
  return self->_retrievalTimeout;
}

- (void)addCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDAccessoryRetrievalCompletionTuple home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDAccessoryRetrievalCompletionTuple completions](self, "completions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = _Block_copy(v4);

  objc_msgSend(v8, "addObject:", v7);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (HMDAccessoryRetrievalCompletionTuple)initWithHome:(id)a3 accessory:(id)a4 linkType:(int64_t)a5
{
  id v8;
  id v9;
  HMDAccessoryRetrievalCompletionTuple *v10;
  HMDAccessoryRetrievalCompletionTuple *v11;
  uint64_t v12;
  NSMutableArray *completions;
  double v14;
  int v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDAccessoryRetrievalCompletionTuple;
  v10 = -[HMDAccessoryRetrievalCompletionTuple init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_home, v8);
    objc_storeWeak((id *)&v11->_accessory, v9);
    v11->_linkType = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    completions = v11->_completions;
    v11->_completions = (NSMutableArray *)v12;

    if (a5 == 2)
    {
      v14 = 60.0;
    }
    else
    {
      v15 = objc_msgSend(v9, "isSuspendCapable");
      v14 = 60.0;
      if (!v15)
        v14 = 30.0;
    }
    v11->_retrievalTimeout = v14;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_destroyWeak((id *)&self->_home);
}

- (void)timerDidFire:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDAccessoryRetrievalCompletionTuple *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  HMDAccessoryRetrievalCompletionTuple *v17;
  NSObject *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAccessoryRetrievalCompletionTuple home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryRetrievalCompletionTuple accessory](v9, "accessory");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAccessoryRetrievalCompletionTuple linkType](v9, "linkType");
      if (v14 > 2)
        v15 = CFSTR("Undefined");
      else
        v15 = off_1E89ABEB0[v14];
      v20 = v15;
      v24 = 138543874;
      v25 = v11;
      v26 = 2112;
      v27 = v13;
      v28 = 2112;
      v29 = v20;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Accessory retrieval timed out for accessory %@/%@", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 100);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessoryRetrievalCompletionTuple accessory](v9, "accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_notifyRetrievalError:accessoryServer:linkType:accessoryOperationBlock:", v21, v23, -[HMDAccessoryRetrievalCompletionTuple linkType](v9, "linkType"), 0);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Accessory retrieval lost reference to home", (uint8_t *)&v24, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void)setLinkType:(int64_t)a3
{
  self->_linkType = a3;
}

- (void)setRetrievalTimeout:(double)a3
{
  self->_retrievalTimeout = a3;
}

@end
