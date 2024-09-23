@implementation HMTRSession

- (HMTRSession)initWithSession:(id)a3
{
  id v4;
  HMTRSession *v5;
  HMTRSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMTRSession;
  v5 = -[HMTRSession init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_session, v4);

  return v6;
}

- (void)sendRequestData:(id)a3 qualityOfService:(int64_t)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  HMDeviceSetupRequestMessage *v10;
  void *v11;
  HMDeviceSetupRequestMessage *v12;
  id v13;
  _QWORD v14[4];
  HMDeviceSetupRequestMessage *v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a5;
  v10 = -[HMDeviceSetupRequestMessage initWithPayload:]([HMDeviceSetupRequestMessage alloc], "initWithPayload:", v8);
  -[HMDeviceSetupRequestMessage setQualityOfService:](v10, "setQualityOfService:", a4);
  objc_initWeak(&location, self);
  -[HMTRSession session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__HMTRSession_sendRequestData_qualityOfService_responseHandler___block_invoke;
  v14[3] = &unk_1E3AB0D80;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v15 = v12;
  v13 = v9;
  v16 = v13;
  objc_msgSend(v11, "sendRequest:withResponseHandler:", v12, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (TRSession)session
{
  return (TRSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_session);
}

void __64__HMTRSession_sendRequestData_qualityOfService_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = (unint64_t)v5;
  v9 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = (void *)v8;
  if (!(v8 | v11))
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = WeakRetained;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 32);
      v20 = 138543874;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Received an unexpected request: %@ response: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = *(_QWORD *)(a1 + 40);
  objc_msgSend((id)v11, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v12, v19);

}

@end
