@implementation HMDRemoteLoginAnisetteDataProvider

- (HMDRemoteLoginAnisetteDataProvider)initWithSessionID:(id)a3 remoteMessageSender:(id)a4
{
  id v7;
  id v8;
  HMDRemoteLoginAnisetteDataProvider *v9;
  HMDRemoteLoginAnisetteDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDRemoteLoginAnisetteDataProvider;
  v9 = -[HMDRemoteLoginAnisetteDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionID, a3);
    objc_storeStrong((id *)&v10->_remoteMessageSender, a4);
  }

  return v10;
}

- (void)provisionAnisetteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA790]), "initNewMessage");
  objc_msgSend(v5, "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginAnisetteDataProvider remoteMessageSender](self, "remoteMessageSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__HMDRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke;
  v12[3] = &unk_1E89C1B70;
  objc_copyWeak(&v14, &location);
  v11 = v4;
  v13 = v11;
  objc_msgSend(v9, "sendRemoteMessageWithName:payload:responseHandler:", v10, v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)syncAnisetteWithSIMData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA8F0]), "initNewMessage");
  objc_msgSend(v8, "setSimData:", v6);
  objc_msgSend(v8, "messageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginAnisetteDataProvider remoteMessageSender](self, "remoteMessageSender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__HMDRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke;
  v15[3] = &unk_1E89C1B70;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  objc_msgSend(v12, "sendRemoteMessageWithName:payload:responseHandler:", v13, v11, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)eraseAnisetteWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA4B0]), "initNewMessage");
  objc_msgSend(v5, "messageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  encodeRootObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginAnisetteDataProvider remoteMessageSender](self, "remoteMessageSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HMDRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke;
  v12[3] = &unk_1E89C1B70;
  objc_copyWeak(&v14, &location);
  v11 = v4;
  v13 = v11;
  objc_msgSend(v9, "sendRemoteMessageWithName:payload:responseHandler:", v10, v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)fetchAnisetteDataAndProvisionIfNecessary:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  void *v18;
  _QWORD v19[2];

  v4 = a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA508]), "initNewMessage");
  objc_msgSend(v7, "setShouldProvision:", v4);
  objc_msgSend(v7, "messageName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginAnisetteDataProvider remoteMessageSender](self, "remoteMessageSender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __94__HMDRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke;
  v14[3] = &unk_1E89C1B70;
  objc_copyWeak(&v16, &location);
  v13 = v6;
  v15 = v13;
  objc_msgSend(v11, "sendRemoteMessageWithName:payload:responseHandler:", v12, v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)legacyAnisetteDataForDSID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA5B8]), "initNewMessage");
  objc_msgSend(v8, "setDsid:", v6);
  objc_msgSend(v8, "messageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HMDRemoteLoginAnisetteDataProvider remoteMessageSender](self, "remoteMessageSender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__HMDRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke;
  v15[3] = &unk_1E89C1B70;
  objc_copyWeak(&v17, &location);
  v14 = v7;
  v16 = v14;
  objc_msgSend(v12, "sendRemoteMessageWithName:payload:responseHandler:", v13, v11, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (HMDRemoteLoginMessageSender)remoteMessageSender
{
  return self->_remoteMessageSender;
}

- (void)setRemoteMessageSender:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMessageSender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteMessageSender, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

void __79__HMDRemoteLoginAnisetteDataProvider_legacyAnisetteDataForDSID_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CBA5C0], "objWithDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "anisetteData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v5);

}

void __94__HMDRemoteLoginAnisetteDataProvider_fetchAnisetteDataAndProvisionIfNecessary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CBA510], "objWithDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v12;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v15, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  v13 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "anisetteData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v13 + 16))(v13, v14, v5);

}

void __66__HMDRemoteLoginAnisetteDataProvider_eraseAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CBA4B8], "objWithDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "didSucceed"), v5);

}

void __73__HMDRemoteLoginAnisetteDataProvider_syncAnisetteWithSIMData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CBA8F8], "objWithDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "didSucceed"), v5);

}

void __70__HMDRemoteLoginAnisetteDataProvider_provisionAnisetteWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CBA798], "objWithDict:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = WeakRetained;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v12;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Received %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v8, "didSucceed"), v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_58843 != -1)
    dispatch_once(&logCategory__hmf_once_t0_58843, &__block_literal_global_58844);
  return (id)logCategory__hmf_once_v1_58845;
}

void __49__HMDRemoteLoginAnisetteDataProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_58845;
  logCategory__hmf_once_v1_58845 = v0;

}

@end
