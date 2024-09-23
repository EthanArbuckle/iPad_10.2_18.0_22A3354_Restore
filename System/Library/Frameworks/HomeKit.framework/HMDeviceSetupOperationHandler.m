@implementation HMDeviceSetupOperationHandler

- (void)registerMessageHandlersForSession:(id)a3
{
  id v4;
  void *v5;
  HMDeviceSetupOperationHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD aBlock[4];
  id v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registering the handlers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v12.receiver = v6;
  v12.super_class = (Class)HMDeviceSetupOperationHandler;
  -[HMDeviceSetupOperationHandlerBase configureSessionForMessages](&v12, sel_configureSessionForMessages);
  objc_initWeak((id *)buf, v6);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__HMDeviceSetupOperationHandler_registerMessageHandlersForSession___block_invoke;
  aBlock[3] = &unk_1E3AAEF18;
  objc_copyWeak(&v11, (id *)buf);
  v9 = _Block_copy(aBlock);
  objc_msgSend(v4, "setRequestHandler:forRequestClass:", v9, objc_opt_class());

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (void)_handleReceivedRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  HMDeviceSetupOperationHandler *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  HMDeviceSetupOperationHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("TRRequestMessageHandler"));
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v8, "markWithReason:", CFSTR("Received request")));
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v15;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    v16 = objc_msgSend(v11, "qualityOfService");
    objc_initWeak((id *)buf, v13);
    -[HMDeviceSetupOperationHandlerBase setupSession](v13, "setupSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "payload");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__HMDeviceSetupOperationHandler__handleReceivedRequest_responseHandler___block_invoke;
    v24[3] = &unk_1E3AB3650;
    v25 = v8;
    v26 = v7;
    objc_copyWeak(&v27, (id *)buf);
    objc_msgSend(v17, "sendExchangeData:qualityOfService:completionHandler:", v18, v16, v24);

    objc_destroyWeak(&v27);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v19 = (void *)MEMORY[0x1A1AC1AAC]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v22;
      v30 = 2112;
      v31 = v9;
      _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Received an unexpected request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v23, 0);

    }
  }

}

void __72__HMDeviceSetupOperationHandler__handleReceivedRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMDeviceSetupResponseMessage *v7;
  id WeakRetained;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  HMDeviceSetupResponseMessage *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  if (*(_QWORD *)(a1 + 40))
  {
    v7 = -[HMDeviceSetupResponseMessage initWithPayload:]([HMDeviceSetupResponseMessage alloc], "initWithPayload:", v5);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Sending response")));
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
      v16 = v7;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending response: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  objc_msgSend(*(id *)(a1 + 32), "end");

}

void __67__HMDeviceSetupOperationHandler_registerMessageHandlersForSession___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleReceivedRequest:responseHandler:", v6, v5);

}

@end
