@implementation HMUserActionPredictionController

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
  if (v5 && !WeakRetained)
  {
    -[HMUserActionPredictionController predictionProvider](self, "predictionProvider");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionController homeIdentifier](self, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubscriber:forHomeIdentifier:", self, v7);
LABEL_7:

    return;
  }
  if (!v5 && WeakRetained)
  {
    -[HMUserActionPredictionController predictionProvider](self, "predictionProvider");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionController homeIdentifier](self, "homeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeSubscriber:forHomeIdentifier:", self, v7);
    goto LABEL_7;
  }
}

- (void)fetchPredictionsWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMUserActionPredictionController *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMUserActionPredictionController *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD, _QWORD);
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMUserActionPredictionController fetchPredictionsWithCompletion:]", CFSTR("completion"));
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
      v28 = v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v5 = (void (**)(_QWORD, _QWORD))v4;
  -[HMUserActionPredictionController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMUserActionPredictionController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "delegateCaller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMUserActionPredictionController predictionProvider](self, "predictionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMUserActionPredictionController homeIdentifier](self, "homeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__HMUserActionPredictionController_fetchPredictionsWithCompletion___block_invoke;
    v22[3] = &unk_1E3AAE7E8;
    v23 = v8;
    v24 = v5;
    v11 = v8;
    objc_msgSend(v9, "fetchPredictionsForHomeWithIdentifier:completion:", v10, v22);

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
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@fetchPredictionsWithCompletion is missing a context", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v5[2](v5, MEMORY[0x1E0C9AA60]);
  }

}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 40, 1);
}

- (HMUserActionPredictionProvider)predictionProvider
{
  return (HMUserActionPredictionProvider *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)homeIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMUserActionPredictionController)initWithHomeIdentifier:(id)a3 predictionProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMUserActionPredictionController *v9;
  uint64_t v10;
  NSUUID *homeIdentifier;
  HMUserActionPredictionController *result;
  HMUserActionPredictionController *v13;
  SEL v14;
  id v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v13 = (HMUserActionPredictionController *)_HMFPreconditionFailure();
    -[HMUserActionPredictionController configureWithContext:](v13, v14, v15);
    return result;
  }
  v16.receiver = self;
  v16.super_class = (Class)HMUserActionPredictionController;
  v9 = -[HMUserActionPredictionController init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D28638], "hmf_cachedInstanceForNSUUID:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    homeIdentifier = v9->_homeIdentifier;
    v9->_homeIdentifier = (NSUUID *)v10;

    objc_storeStrong((id *)&v9->_predictionProvider, a4);
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

uint64_t __67__HMUserActionPredictionController_fetchPredictionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCompletion:array:", *(_QWORD *)(a1 + 40), a2);
}

- (HMUserActionPredictionControllerDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HMUserActionPredictionControllerDelegate *)WeakRetained;
}

- (id)predictions
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

- (void)didUpdatePredictions:(id)a3 forHomeWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  HMUserActionPredictionController *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMUserActionPredictionController *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMUserActionPredictionController *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMUserActionPredictionController homeIdentifier](self, "homeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);

  if (v9)
  {
    -[HMUserActionPredictionController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v14;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate: %@ of updated user action predictions: %@ for home with identifier: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMUserActionPredictionController context](v12, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "delegateCaller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __79__HMUserActionPredictionController_didUpdatePredictions_forHomeWithIdentifier___block_invoke;
      v21[3] = &unk_1E3AB5CD0;
      v22 = v10;
      v23 = v12;
      v24 = v6;
      objc_msgSend(v16, "invokeBlock:", v21);

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      v27 = 2112;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Not notifying of updated user action predictions: %@ for home with identifier: %@ due to wrong home", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_predictionProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __79__HMUserActionPredictionController_didUpdatePredictions_forHomeWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userActionPredictionController:didUpdatePredictions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6 != -1)
    dispatch_once(&logCategory__hmf_once_t6, &__block_literal_global_9115);
  return (id)logCategory__hmf_once_v7;
}

void __47__HMUserActionPredictionController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7;
  logCategory__hmf_once_v7 = v0;

}

@end
