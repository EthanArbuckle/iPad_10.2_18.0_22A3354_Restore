@implementation HKSecondaryDevicePairingAgent

- (HKSecondaryDevicePairingAgent)initWithHealthStore:(id)a3
{
  id v5;
  HKSecondaryDevicePairingAgent *v6;
  HKSecondaryDevicePairingAgent *v7;
  uint64_t v8;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v10;
  HKTaskServerProxyProvider *proxyProvider;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSecondaryDevicePairingAgent;
  v6 = -[HKSecondaryDevicePairingAgent init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSUUID *)v8;

    v10 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v7->_healthStore, CFSTR("HKSecondaryDevicePairingAgentServerIdentifier"), v7, v7->_identifier);
    proxyProvider = v7->_proxyProvider;
    v7->_proxyProvider = v10;

    -[HKProxyProvider setShouldRetryOnInterruption:](v7->_proxyProvider, "setShouldRetryOnInterruption:", 0);
  }

  return v7;
}

- (void)requestTinkerSharingOptInWithGuardianDisplayName:(id)a3 NRDeviceUUID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  _HKInitializeLogging();
  v12 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = self;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v10;
    _os_log_impl(&dword_19A0E6000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with guardian display name: %{public}@, NRDevice UUID: %{public}@ (#t0)", buf, 0x2Au);

  }
  proxyProvider = self->_proxyProvider;
  v16 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke;
  v23[3] = &unk_1E37F6800;
  v24 = v9;
  v25 = v10;
  v26 = v11;
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2;
  v20[3] = &unk_1E37E9F38;
  v21 = v26;
  v22 = a2;
  v20[4] = self;
  v17 = v26;
  v18 = v10;
  v19 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v23, v20);

}

uint64_t __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "remote_requestTinkerSharingOptInWithGuardianDisplayName:NRDeviceUUID:completion:", a1[4], a1[5], a1[6]);
}

void __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setupHealthSharingForSecondaryPairedDeviceWithConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with configuration: %{public}@ (#t0)", buf, 0x20u);

  }
  v12 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke;
  v19[3] = &unk_1E37F6828;
  v20 = v7;
  v21 = v8;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke_2;
  v16[3] = &unk_1E37E9F38;
  v17 = v21;
  v18 = a2;
  v16[4] = self;
  v14 = v21;
  v15 = v7;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v19, v16);

}

uint64_t __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_setupHealthSharingForSecondaryPairedDeviceWithConfiguration:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __104__HKSecondaryDevicePairingAgent_setupHealthSharingForSecondaryPairedDeviceWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)performEndToEndCloudSyncWithNRDeviceUUID:(id)a3 syncParticipantFirst:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[4];
  id v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  _HKInitializeLogging();
  v11 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    NSStringFromSelector(a2);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("NO");
    *(_DWORD *)buf = 138544130;
    v28 = self;
    if (v6)
      v15 = CFSTR("YES");
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v9;
    v33 = 2114;
    v34 = v15;
    _os_log_impl(&dword_19A0E6000, v12, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called with NRDevice UUID: %{public}@, syncParticipantFirst: %{public}@ (#t0)", buf, 0x2Au);

  }
  proxyProvider = self->_proxyProvider;
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke;
  v23[3] = &unk_1E37F6850;
  v24 = v9;
  v26 = v6;
  v25 = v10;
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2;
  v20[3] = &unk_1E37E9F38;
  v21 = v25;
  v22 = a2;
  v20[4] = self;
  v18 = v25;
  v19 = v9;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v23, v20);

}

uint64_t __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_performEndToEndCloudSyncWithNRDeviceUUID:syncParticipantFirst:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __106__HKSecondaryDevicePairingAgent_performEndToEndCloudSyncWithNRDeviceUUID_syncParticipantFirst_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)tearDownHealthSharingWithPairedGuardianWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);

  }
  proxyProvider = self->_proxyProvider;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke;
  v15[3] = &unk_1E37F6878;
  v16 = v5;
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke_2;
  v12[3] = &unk_1E37E9F38;
  v13 = v16;
  v14 = a2;
  v12[4] = self;
  v11 = v16;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v15, v12);

}

uint64_t __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingWithPairedGuardianWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __87__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithPairedGuardianWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)tearDownHealthSharingWithTinkerDeviceWithNRUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  HKTaskServerProxyProvider *proxyProvider;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ %{public}@ called (#t0)", buf, 0x16u);

  }
  v12 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke;
  v19[3] = &unk_1E37F6828;
  v20 = v7;
  v21 = v8;
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_2;
  v16[3] = &unk_1E37E9F38;
  v17 = v21;
  v18 = a2;
  v16[4] = self;
  v14 = v21;
  v15 = v7;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v19, v16);

}

uint64_t __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_tearDownHealthSharingWithTinkerDeviceWithNRUUID:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __92__HKSecondaryDevicePairingAgent_tearDownHealthSharingWithTinkerDeviceWithNRUUID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSharingStatusWithPairedGuardianWithCompletion:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_INFO, "[sharing-setup] %{public}@ %{public}@", buf, 0x16u);

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  proxyProvider = self->_proxyProvider;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke;
  v16[3] = &unk_1E37F6878;
  v17 = v9;
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2;
  v13[3] = &unk_1E37E9F38;
  v14 = v17;
  v15 = a2;
  v13[4] = self;
  v12 = v17;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v16, v13);

}

uint64_t __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingStatusWithPairedGuardianWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKTaskServerProxyProvider *proxyProvider;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  HKSecondaryDevicePairingAgent *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "[sharing-setup] %{public}@ %{public}@", buf, 0x16u);

  }
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](self->_proxyProvider, "clientQueueActionHandlerWithCompletion:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke;
  v20[3] = &unk_1E37F6828;
  v21 = v7;
  v22 = v12;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke_2;
  v17[3] = &unk_1E37E9F38;
  v18 = v22;
  v19 = a2;
  v17[4] = self;
  v15 = v22;
  v16 = v7;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v20, v17);

}

uint64_t __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __101__HKSecondaryDevicePairingAgent_fetchSharingStatusForCurrentAppleIDWithOwnerEmailAddress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)clientInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE4100C8);
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE410128);
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __106__HKSecondaryDevicePairingAgent_requestTinkerSharingOptInWithGuardianDisplayName_NRDeviceUUID_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_11(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_7();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_2_8(&dword_19A0E6000, v5, v6, "[sharing-setup] %{public}@: %{public}@ call failed: %{public}@ (#t0)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_1();
}

void __84__HKSecondaryDevicePairingAgent_fetchSharingStatusWithPairedGuardianWithCompletion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  const char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_2_11(a1, a2);
  v3 = (const char *)OUTLINED_FUNCTION_7();
  NSStringFromSelector(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_2_8(&dword_19A0E6000, v5, v6, "%{public}@: %{public}@ call failed: %{public}@ (#t0)", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_1();
}

@end
