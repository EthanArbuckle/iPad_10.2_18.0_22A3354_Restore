@implementation HMAutoAddWalletKeySupressionAssertion

- (HMAutoAddWalletKeySupressionAssertion)initWithHomeManager:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  HMAutoAddWalletKeySupressionAssertion *v10;
  uint64_t v11;
  NSUUID *homeUUID;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
  v10 = -[HMFAssertion initWithName:](&v14, sel_initWithName_, v9);

  if (v10)
  {
    objc_storeWeak((id *)&v10->_homeManager, v6);
    v11 = objc_msgSend(v7, "copy");
    homeUUID = v10->_homeUUID;
    v10->_homeUUID = (NSUUID *)v11;

  }
  return v10;
}

- (void)acquireWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMAutoAddWalletKeySupressionAssertion *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  HMAutoAddWalletKeySupressionAssertion *v22;
  id v23;
  objc_super v24;
  const __CFString *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAutoAddWalletKeySupressionAssertion homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v24.receiver = self;
    v24.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
    -[HMFAssertion acquire:](&v24, sel_acquire_, 0);
    v25 = CFSTR("HMHomeManagerMessageKeyHomeUUID");
    -[HMAutoAddWalletKeySupressionAssertion homeUUID](self, "homeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTarget:", v9);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMHomeManagerAutoAddWalletKeySupressionAssertionAcquireMessage"), v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __63__HMAutoAddWalletKeySupressionAssertion_acquireWithCompletion___block_invoke;
    v21 = &unk_1E3AB59B8;
    v22 = self;
    v23 = v4;
    objc_msgSend(v11, "setResponseHandler:", &v18);
    objc_msgSend(v5, "context", v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "messageDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendMessage:", v11);

  }
  else
  {
    v14 = (void *)MEMORY[0x1A1AC1AAC]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Cannot acquire auto add wallet key suppression assertion, home manager is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }

}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMAutoAddWalletKeySupressionAssertion *v13;
  NSObject *v14;
  void *v15;
  objc_super v16;
  const __CFString *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
  -[HMFAssertion invalidate](&v16, sel_invalidate);
  -[HMAutoAddWalletKeySupressionAssertion homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = CFSTR("HMHomeManagerMessageKeyHomeUUID");
    -[HMAutoAddWalletKeySupressionAssertion homeUUID](self, "homeUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x1E0D285D8]);
    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithTarget:", v7);

    objc_msgSend(MEMORY[0x1E0D285F8], "messageWithName:destination:payload:", CFSTR("HMHomeManagerAutoAddWalletKeySupressionAssertionReleaseMessage"), v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResponseHandler:", &__block_literal_global_52819);
    objc_msgSend(v3, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendMessage:", v9);

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
      v20 = v15;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot release auto add wallet key suppression assertion, home manager is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (HMHomeManager)homeManager
{
  return (HMHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __51__HMAutoAddWalletKeySupressionAssertion_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1A1AC1AAC]();
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v9;
      v16 = 2112;
      v17 = v4;
      v10 = "%{public}@Failed to release auto add wallet key suppression assertion: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v11, v12, v10, (uint8_t *)&v14, v13);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v9;
    v10 = "%{public}@Successfully released auto add wallet key suppression assertion";
    v11 = v8;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v6);
}

void __63__HMAutoAddWalletKeySupressionAssertion_acquireWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_super v4;

  v3 = a2;
  if (v3)
  {
    v4.receiver = *(id *)(a1 + 32);
    v4.super_class = (Class)HMAutoAddWalletKeySupressionAssertion;
    objc_msgSendSuper2(&v4, sel_invalidate);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
