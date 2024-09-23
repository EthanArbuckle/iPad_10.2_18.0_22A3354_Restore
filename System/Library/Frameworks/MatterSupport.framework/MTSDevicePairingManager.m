@implementation MTSDevicePairingManager

- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3
{
  id v4;
  MTSXPCServerProxy *v5;
  MTSDevicePairingManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(MTSXPCServerProxy);
  v6 = -[MTSDevicePairingManager initWithSystemCommissionerPairing:serverProxy:](self, "initWithSystemCommissionerPairing:serverProxy:", v4, v5);

  return v6;
}

- (MTSDevicePairingManager)initWithSystemCommissionerPairing:(id)a3 serverProxy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MTSDevicePairingManager *v9;
  uint64_t v10;
  MTSSystemCommissionerPairing *systemCommissionerPairing;
  MTSDevicePairingManager *result;
  MTSDevicePairingManager *v13;
  SEL v14;
  objc_super v15;

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
    v13 = (MTSDevicePairingManager *)_HMFPreconditionFailure();
    -[MTSDevicePairingManager dealloc](v13, v14);
    return result;
  }
  v15.receiver = self;
  v15.super_class = (Class)MTSDevicePairingManager;
  v9 = -[MTSDevicePairingManager init](&v15, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    systemCommissionerPairing = v9->_systemCommissionerPairing;
    v9->_systemCommissionerPairing = (MTSSystemCommissionerPairing *)v10;

    objc_storeStrong((id *)&v9->_serverProxy, a4);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[MTSXPCServerProxy invalidate](self->_serverProxy, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MTSDevicePairingManager;
  -[MTSDevicePairingManager dealloc](&v3, sel_dealloc);
}

- (void)fetchPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTSDevicePairingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Fetch all device pairings"));
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Fetching all device pairings", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSDevicePairingManager serverProxy](v8, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDevicePairingManager systemCommissionerPairing](v8, "systemCommissionerPairing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__MTSDevicePairingManager_fetchPairingsWithCompletionHandler___block_invoke;
  v18[3] = &unk_250599D40;
  v18[4] = v8;
  v19 = v6;
  v20 = v5;
  v16 = v5;
  v17 = v6;
  objc_msgSend(v13, "fetchDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v15, v18);

}

- (void)removePairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  MTSDevicePairingManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_7:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove device pairing"));
  v10 = (void *)MEMORY[0x23493F978]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v13;
    v26 = 2114;
    v27 = v15;
    v28 = 2112;
    v29 = v6;
    _os_log_impl(&dword_2344FE000, v12, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing device pairing with UUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[MTSDevicePairingManager serverProxy](v11, "serverProxy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDevicePairingManager systemCommissionerPairing](v11, "systemCommissionerPairing");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67__MTSDevicePairingManager_removePairingWithUUID_completionHandler___block_invoke;
  v21[3] = &unk_250599D68;
  v21[4] = v11;
  v22 = v9;
  v23 = v8;
  v19 = v8;
  v20 = v9;
  objc_msgSend(v16, "removeDevicePairingWithUUID:forSystemCommissionerPairingUUID:completionHandler:", v6, v18, v21);

}

- (void)removeAllPairingsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTSDevicePairingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Remove all device pairings"));
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Removing all device pairings", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSDevicePairingManager serverProxy](v8, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDevicePairingManager systemCommissionerPairing](v8, "systemCommissionerPairing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __66__MTSDevicePairingManager_removeAllPairingsWithCompletionHandler___block_invoke;
  v18[3] = &unk_250599D68;
  v18[4] = v8;
  v19 = v6;
  v20 = v5;
  v16 = v5;
  v17 = v6;
  objc_msgSend(v13, "removeAllDevicePairingsForSystemCommissionerPairingUUID:completionHandler:", v15, v18);

}

- (void)openCommissioningWindowWithDuration:(double)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  MTSDevicePairingManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
    _HMFPreconditionFailure();
  v7 = v6;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Open commissioning window"));
  v9 = (void *)MEMORY[0x23493F978]();
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
    *(_DWORD *)buf = 138543618;
    v24 = v12;
    v25 = 2114;
    v26 = v14;
    _os_log_impl(&dword_2344FE000, v11, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Opening commissioning window", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  -[MTSDevicePairingManager serverProxy](v10, "serverProxy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDevicePairingManager systemCommissionerPairing](v10, "systemCommissionerPairing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __81__MTSDevicePairingManager_openCommissioningWindowWithDuration_completionHandler___block_invoke;
  v20[3] = &unk_250599C60;
  v20[4] = v10;
  v21 = v8;
  v22 = v7;
  v18 = v7;
  v19 = v8;
  objc_msgSend(v15, "openCommissioningWindowForSystemCommissionerPairingUUID:duration:completionHandler:", v17, v20, a3);

}

- (void)readCommissioningWindowStatusWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  MTSDevicePairingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:", CFSTR("Read commissioning window status"));
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v10;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Reading commissioning window status", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[MTSDevicePairingManager serverProxy](v8, "serverProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTSDevicePairingManager systemCommissionerPairing](v8, "systemCommissionerPairing");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __78__MTSDevicePairingManager_readCommissioningWindowStatusWithCompletionHandler___block_invoke;
  v18[3] = &unk_250599C88;
  v18[4] = v8;
  v19 = v6;
  v20 = v5;
  v16 = v5;
  v17 = v6;
  objc_msgSend(v13, "readCommissioningWindowStatusForSystemCommissionerPairingUUID:completionHandler:", v15, v18);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MTSDevicePairingManager systemCommissionerPairing](self, "systemCommissionerPairing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MTSSystemCommissionerPairing)systemCommissionerPairing
{
  return (MTSSystemCommissionerPairing *)objc_getProperty(self, a2, 8, 1);
}

- (MTSXPCServerProxy)serverProxy
{
  return (MTSXPCServerProxy *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverProxy, 0);
  objc_storeStrong((id *)&self->_systemCommissionerPairing, 0);
}

void __78__MTSDevicePairingManager_readCommissioningWindowStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2112;
      v23 = v6;
      v14 = "%{public}@[%{public}@] Failed to read commissioning window status: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v15, v16, v14, (uint8_t *)&v18, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = v5;
    v14 = "%{public}@[%{public}@] Successfully read commissioning window status: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v17);

}

void __81__MTSDevicePairingManager_openCommissioningWindowWithDuration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x23493F978]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544130;
      v24 = v14;
      v25 = 2114;
      v26 = v16;
      v27 = 2112;
      v28 = v7;
      v29 = 2112;
      v30 = v8;
      v17 = "%{public}@[%{public}@] Successfully opened commissioning window with setup QR code: %@, manual pairing code: %@";
      v18 = v13;
      v19 = OS_LOG_TYPE_INFO;
      v20 = 42;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v18, v19, v17, (uint8_t *)&v23, v20);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v14;
    v25 = 2114;
    v26 = v16;
    v27 = 2112;
    v28 = v9;
    v17 = "%{public}@[%{public}@] Failed to open commissioning window: %@";
    v18 = v13;
    v19 = OS_LOG_TYPE_ERROR;
    v20 = 32;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
  (*(void (**)(_QWORD, id, id, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7, v8, v9, v21, v22);

}

void __66__MTSDevicePairingManager_removeAllPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@[%{public}@] Failed to remove all device pairings: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v11 = "%{public}@[%{public}@] Successfully removed all device pairings";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v15, v16);

}

void __67__MTSDevicePairingManager_removePairingWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x23493F978]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v8;
      v19 = 2114;
      v20 = v10;
      v21 = 2112;
      v22 = v3;
      v11 = "%{public}@[%{public}@] Failed to remove device pairing: %@";
      v12 = v7;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v12, v13, v11, (uint8_t *)&v17, v14);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138543618;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v11 = "%{public}@[%{public}@] Successfully removed device pairing";
    v12 = v7;
    v13 = OS_LOG_TYPE_INFO;
    v14 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v3, v15, v16);

}

void __62__MTSDevicePairingManager_fetchPairingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x23493F978]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shortDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 2048;
      v23 = objc_msgSend(v5, "count");
      v14 = "%{public}@[%{public}@] Fetched %ld device pairings";
      v15 = v10;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_2344FE000, v15, v16, v14, (uint8_t *)&v18, 0x20u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    v22 = 2112;
    v23 = (uint64_t)v6;
    v14 = "%{public}@[%{public}@] Failed to fetch device pairings: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v6, v17);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t15 != -1)
    dispatch_once(&logCategory__hmf_once_t15, &__block_literal_global_370);
  return (id)logCategory__hmf_once_v16;
}

void __38__MTSDevicePairingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v16;
  logCategory__hmf_once_v16 = v0;

}

@end
