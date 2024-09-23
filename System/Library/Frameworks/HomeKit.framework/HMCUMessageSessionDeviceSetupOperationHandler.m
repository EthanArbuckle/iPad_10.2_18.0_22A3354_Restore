@implementation HMCUMessageSessionDeviceSetupOperationHandler

- (void)registerMessageHandlersForMessageSession:(id)a3
{
  id v4;
  void *v5;
  HMCUMessageSessionDeviceSetupOperationHandler *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
    v13 = v8;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Registering the handlers", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  v11.receiver = v6;
  v11.super_class = (Class)HMCUMessageSessionDeviceSetupOperationHandler;
  -[HMDeviceSetupOperationHandlerBase configureSessionForMessages](&v11, sel_configureSessionForMessages);
  objc_initWeak((id *)buf, v6);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __90__HMCUMessageSessionDeviceSetupOperationHandler_registerMessageHandlersForMessageSession___block_invoke;
  v9[3] = &unk_1E3AB3628;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v4, "registerRequestID:options:handler:", CFSTR("HMDSS.cu.rq"), 0, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)_handleReceivedRequestDictionary:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMCUMessageSessionDeviceSetupOperationHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  HMCUMessageSessionDeviceSetupOperationHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  const __CFString *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", CFSTR("TRRequestMessageHandler"));
  objc_msgSend(v6, "dataForKey:", CFSTR("da"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_numberForKey:", CFSTR("qos"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (v10)
      v12 = objc_msgSend(v10, "integerValue");
    else
      v12 = -1;
    v20 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v8, "markWithReason:", CFSTR("Received request")));
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v23;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Received request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_initWeak((id *)buf, v21);
    -[HMDeviceSetupOperationHandlerBase setupSession](v21, "setupSession");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __98__HMCUMessageSessionDeviceSetupOperationHandler__handleReceivedRequestDictionary_responseHandler___block_invoke;
    v25[3] = &unk_1E3AB3650;
    v26 = v8;
    objc_copyWeak(&v28, (id *)buf);
    v27 = v7;
    objc_msgSend(v24, "sendExchangeData:qualityOfService:completionHandler:", v9, v12, v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Received an unexpected request with no data %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "code");
    v29 = CFSTR("err");
    v30 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, (v18 + 300200), 0, v19);

  }
}

- (int)convertSetupErrorToOSStatus:(id)a3
{
  id v3;
  void *v4;
  char v5;
  unsigned __int16 v6;
  void *v7;
  int v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("HMErrorDomain"));

  if ((v5 & 1) != 0)
  {
    v6 = -27480;
  }
  else
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D27FC8]);

    if (!v8)
    {
      v9 = -6700;
      goto LABEL_7;
    }
    v6 = -15080;
  }
  v9 = (v6 | 0x40000) + objc_msgSend(v3, "code");
LABEL_7:

  return v9;
}

void __98__HMCUMessageSessionDeviceSetupOperationHandler__handleReceivedRequestDictionary_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
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
  objc_msgSend(*(id *)(a1 + 32), "begin");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("da"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("err"));
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
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Sending response payload: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v9);
  if (v6)
    objc_msgSend(v10, "convertSetupErrorToOSStatus:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "end");

}

void __90__HMCUMessageSessionDeviceSetupOperationHandler_registerMessageHandlersForMessageSession___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleReceivedRequestDictionary:responseHandler:", v7, v6);

}

@end
