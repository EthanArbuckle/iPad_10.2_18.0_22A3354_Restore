@implementation HMDFairPlaySAPSession

- (HMDFairPlaySAPSession)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDFairPlaySAPSession *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *clientQueue;
  uint64_t v15;
  NSUUID *sessionIdentifier;
  HMDFairPlaySAPSession *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v22.receiver = self;
    v22.super_class = (Class)HMDFairPlaySAPSession;
    v9 = -[HMDFairPlaySAPSession init](&v22, sel_init);
    if (v9)
    {
      HMDispatchQueueNameString();
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = (const char *)objc_msgSend(v10, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_queue_create(v11, v12);
      clientQueue = v9->_clientQueue;
      v9->_clientQueue = (OS_dispatch_queue *)v13;

      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v15 = objc_claimAutoreleasedReturnValue();
      sessionIdentifier = v9->_sessionIdentifier;
      v9->_sessionIdentifier = (NSUUID *)v15;

      objc_storeWeak((id *)&v9->_delegate, v6);
      objc_storeStrong((id *)&v9->_delegateQueue, a4);
    }
    self = v9;
    v17 = self;
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v20;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@[HMDFairPlaySAPSession] Invalid parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  -[HMDFairPlaySAPSession _teardown](self, "_teardown");
  v3.receiver = self;
  v3.super_class = (Class)HMDFairPlaySAPSession;
  -[HMDFairPlaySAPSession dealloc](&v3, sel_dealloc);
}

- (void)openWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HMDFairPlaySAPSession_close__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDFairPlaySAPSession _teardown](self, "_teardown");
  -[HMDFairPlaySAPSession setState:](self, "setState:", 3);
  -[HMDFairPlaySAPSession delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HMDFairPlaySAPSession delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __41__HMDFairPlaySAPSession__closeWithError___block_invoke;
    v8[3] = &unk_24E79C268;
    v8[4] = self;
    v9 = v4;
    dispatch_async(v7, v8);

  }
}

- (void)_teardown
{
  FPSAPContextOpaque_ *session;

  session = self->_session;
  if (session)
  {
    IPaI1oem5iL((uint64_t)session);
    self->_session = 0;
  }
}

- (void)_setupSAPSessionWithCompletionQueue:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD block[5];
  NSObject *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[HMDFairPlaySAPSession delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HMDFairPlaySAPSession setState:](self, "setState:", 1);
    -[HMDFairPlaySAPSession delegateQueue](self, "delegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke;
    block[3] = &unk_24E79B440;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("The FairPlay session delegate is missing"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && v7)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_3;
      v11[3] = &unk_24E79C2B8;
      v13 = v7;
      v12 = v10;
      dispatch_async(v6, v11);

    }
    -[HMDFairPlaySAPSession _closeWithError:](self, "_closeWithError:", v10);

  }
}

- (void)_handleServerCertificate:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  HMDFairPlaySAPSession *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
  v20 = v11;
  v21 = v12;
  v23 = v10;
  v24 = v13;
  v22 = self;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

- (void)_handleServerSAPExchangeData:(id)a3 error:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  HMDFairPlaySAPSession *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
  v20 = v11;
  v21 = v12;
  v23 = v10;
  v24 = v13;
  v22 = self;
  v15 = v10;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

- (void)signatureForData:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  HMDFairPlaySAPSession *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke;
  v15[3] = &unk_24E79B3F0;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)verifySignedData:(id)a3 signature:(id)a4 completionQueue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  HMDFairPlaySAPSession *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMDFairPlaySAPSession clientQueue](self, "clientQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke;
  block[3] = &unk_24E799A68;
  v20 = v10;
  v21 = v12;
  v23 = v11;
  v24 = v13;
  v22 = self;
  v15 = v11;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  dispatch_async(v14, block);

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (HMDFairPlaySAPSessionDelegate)delegate
{
  return (HMDFairPlaySAPSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (FPSAPContextOpaque_)session
{
  return self->_session;
}

- (FairPlayHWInfo_)hardwareInfo
{
  *retstr = *(FairPlayHWInfo_ *)((char *)self + 56);
  return self;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 48), "state") == 2)
    {
      v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      objc_msgSend(*(id *)(a1 + 48), "session");
      objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "bytes");
      objc_msgSend(*(id *)(a1 + 56), "length");
      v3 = objc_retainAutorelease(v2);
      objc_msgSend(v3, "mutableBytes");
      objc_msgSend(v3, "length");
      gLg1CWr7p();
      if ((_DWORD)v4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to verified signed data with error: %d"), v4);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v32 = v8;
          v33 = 2112;
          v34 = v5;
          _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v6);
        v9 = *(NSObject **)(a1 + 40);
        if (v9)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_39;
            block[3] = &unk_24E79C2B8;
            v5 = v5;
            v25 = v5;
            v26 = *(id *)(a1 + 64);
            dispatch_async(v9, block);

          }
        }
      }
      else
      {
        v20 = *(NSObject **)(a1 + 40);
        if (!v20)
          goto LABEL_23;
        v21 = *(void **)(a1 + 64);
        if (!v21)
          goto LABEL_23;
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_2;
        v22[3] = &unk_24E799CC8;
        v23 = v21;
        dispatch_async(v20, v22);
        v5 = v23;
      }

LABEL_23:
      return;
    }
    v15 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] FairPlay session is not open", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v18 = *(NSObject **)(a1 + 40);
    if (v18)
    {
      v19 = *(void **)(a1 + 64);
      if (v19)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_36;
        v27[3] = &unk_24E799CC8;
        v28 = v19;
        dispatch_async(v18, v27);
        v3 = v28;
        goto LABEL_23;
      }
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] invalid parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v13 = *(NSObject **)(a1 + 40);
    if (v13)
    {
      v14 = *(void **)(a1 + 64);
      if (v14)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_35;
        v29[3] = &unk_24E799CC8;
        v30 = v14;
        dispatch_async(v13, v29);
        v3 = v30;
        goto LABEL_23;
      }
    }
  }
}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_35(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 27, CFSTR("invalid parameter"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_36(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 21, CFSTR("FairPlay session is not open"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_39(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, *(_QWORD *)(a1 + 32), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __86__HMDFairPlaySAPSession_verifySignedData_signature_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  _QWORD block[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  unsigned int v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  v32 = 0;
  if (!*(_QWORD *)(a1 + 32))
  {
    v9 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] invalid parameter", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v12 = *(NSObject **)(a1 + 40);
    if (v12)
    {
      v13 = *(void **)(a1 + 56);
      if (v13)
      {
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_26;
        v30[3] = &unk_24E799CC8;
        v31 = v13;
        dispatch_async(v12, v30);
        v19 = 0;
        v5 = v31;
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_27:
    v19 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "state") != 2)
  {
    v14 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] FairPlay session is not open", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v17 = *(NSObject **)(a1 + 40);
    if (v17)
    {
      v18 = *(void **)(a1 + 56);
      if (v18)
      {
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_29;
        v28[3] = &unk_24E799CC8;
        v29 = v18;
        dispatch_async(v17, v28);
        v19 = 0;
        v5 = v29;
        goto LABEL_31;
      }
    }
    goto LABEL_27;
  }
  Fc3vhtJDvr(objc_msgSend(*(id *)(a1 + 48), "session"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"), (uint64_t)&v33, (uint64_t)&v32);
  if ((_DWORD)v2)
    v3 = 1;
  else
    v3 = v33 == 0;
  if (v3 || v32 == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to sign data with error: %d"), v32, v2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v8;
      v36 = 2112;
      v37 = v5;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v19 = *(NSObject **)(a1 + 40);
    if (v19)
    {
      if (*(_QWORD *)(a1 + 56))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_34;
        block[3] = &unk_24E79C2B8;
        v5 = v5;
        v26 = v5;
        v27 = *(id *)(a1 + 56);
        dispatch_async(v19, block);

      }
      v19 = 0;
    }
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v19 = objc_claimAutoreleasedReturnValue();
  free(v33);
  v20 = *(NSObject **)(a1 + 40);
  if (v20)
  {
    v21 = *(void **)(a1 + 56);
    if (v21)
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_2;
      v22[3] = &unk_24E79C2B8;
      v24 = v21;
      v19 = v19;
      v23 = v19;
      dispatch_async(v20, v22);

      v5 = v24;
      goto LABEL_31;
    }
  }
LABEL_32:

}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_26(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 27, CFSTR("invalid parameter"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_29(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 21, CFSTR("FairPlay session is not open"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_34(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, *(_QWORD *)(a1 + 32), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __76__HMDFairPlaySAPSession_signatureForData_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  int v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  v25 = 0;
  v24 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      v4 = *(void **)(a1 + 64);
      if (v4)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2;
        block[3] = &unk_24E79C2B8;
        v23 = v4;
        v22 = *(id *)(a1 + 32);
        dispatch_async(v3, block);

        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(a1 + 48), "_closeWithError:", v2);
  }
  Mib5yocT(200, *(_QWORD *)(a1 + 48) + 56, objc_msgSend(*(id *)(a1 + 48), "session"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "bytes"), objc_msgSend(*(id *)(a1 + 56), "length"), (uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v26);
  if ((_DWORD)v5)
    v6 = 0;
  else
    v6 = v26 == 0;
  if (!v6)
  {
    if ((_DWORD)v5)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to complete SAP Setup Exchange with error: %d"), v5);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected return code '%d' after getting exchange data"), v26);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v12;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, v9, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(NSObject **)(a1 + 40);
    if (v14)
    {
      v15 = *(void **)(a1 + 64);
      if (v15)
      {
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_24;
        v18[3] = &unk_24E79C2B8;
        v20 = v15;
        v19 = v13;
        dispatch_async(v14, v18);

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "_closeWithError:", v13);

    goto LABEL_22;
  }
  objc_msgSend(*(id *)(a1 + 48), "setState:", 2);
  v7 = *(NSObject **)(a1 + 40);
  if (v7)
  {
    v8 = *(void **)(a1 + 64);
    if (v8)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2_25;
      v16[3] = &unk_24E799CC8;
      v17 = v8;
      dispatch_async(v7, v16);
      v9 = v17;
LABEL_22:

    }
  }
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __94__HMDFairPlaySAPSession__handleServerSAPExchangeData_error_completionQueue_completionHandler___block_invoke_2_25(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke(id *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  int v34;
  void *v35;
  char v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  v35 = 0;
  v34 = 0;
  v2 = a1[4];
  if (v2)
  {
    v3 = a1[5];
    if (v3)
    {
      v4 = a1[8];
      if (v4)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2;
        block[3] = &unk_24E79C2B8;
        v33 = v4;
        v32 = a1[4];
        dispatch_async(v3, block);

        v2 = a1[4];
      }
    }
    objc_msgSend(a1[6], "_closeWithError:", v2);
  }
  Mib5yocT(200, (uint64_t)a1[6] + 56, objc_msgSend(a1[6], "session"), objc_msgSend(objc_retainAutorelease(a1[7]), "bytes"), objc_msgSend(a1[7], "length"), (uint64_t)&v35, (uint64_t)&v34, (uint64_t)&v36);
  if ((_DWORD)v5)
    v6 = 1;
  else
    v6 = v35 == 0;
  v7 = v6 || v34 == 0;
  v8 = v7;
  if (v7 || v36 != 1)
  {
    if (v8)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get exchange data with error: %d"), v5);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected return code '%d' after getting exchange data"), v36);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v14;
      v39 = 2112;
      v40 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, v9, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    if (!v16)
      goto LABEL_31;
    v17 = a1[8];
    if (!v17)
      goto LABEL_31;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_19;
    v28[3] = &unk_24E79C2B8;
    v30 = v17;
    v29 = v15;
    dispatch_async(v16, v28);

    v18 = v30;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  free(v35);
  objc_msgSend(a1[6], "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("The FairPlay session delegate is missing"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = a1[5];
    if (!v19)
      goto LABEL_31;
    v20 = a1[8];
    if (!v20)
      goto LABEL_31;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_4;
    v21[3] = &unk_24E79C2B8;
    v23 = v20;
    v22 = v15;
    dispatch_async(v19, v21);

    v18 = v23;
LABEL_30:

LABEL_31:
    objc_msgSend(a1[6], "_closeWithError:", v15);

    goto LABEL_32;
  }
  objc_msgSend(a1[6], "delegateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2_21;
  v24[3] = &unk_24E79B3F0;
  v24[4] = a1[6];
  v9 = v9;
  v25 = v9;
  v26 = a1[5];
  v27 = a1[8];
  dispatch_async(v11, v24);

LABEL_32:
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_19(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_2_21(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_3;
  v5[3] = &unk_24E7913C8;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "session:didReceiveClientExchangeData:completionHandler:", v3, v4, v5);

}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __90__HMDFairPlaySAPSession__handleServerCertificate_error_completionQueue_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleServerSAPExchangeData:error:completionQueue:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_2;
  v4[3] = &unk_24E7913C8;
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "session:didReceiveServerCertificateRequestWithCompletionHandler:", v5, v4);

}

uint64_t __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __79__HMDFairPlaySAPSession__setupSAPSessionWithCompletionQueue_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleServerCertificate:error:completionQueue:completionHandler:", a2, a3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __41__HMDFairPlaySAPSession__closeWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:didCloseWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __30__HMDFairPlaySAPSession_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", 0);
}

void __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  if (v2)
  {
    v3 = CFSTR("Negotiating");
    if (v2 == 2)
      v3 = CFSTR("Open");
    if (v2 == 3)
      v3 = CFSTR("Closed");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot open a FairPlay session in state '%@'"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v8 = *(NSObject **)(a1 + 40);
    if (v8)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_4;
        block[3] = &unk_24E79C2B8;
        v20 = v4;
        v21 = *(id *)(a1 + 48);
        dispatch_async(v8, block);

      }
    }
LABEL_18:

    return;
  }
  cp2g1b9ro(*(_QWORD *)(a1 + 32) + 40, *(_QWORD *)(a1 + 32) + 56);
  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create fairplay session with error: %d"), v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v12;
      v24 = 2112;
      v25 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@[HMDFairPlaySAPSession] %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, v4, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(NSObject **)(a1 + 40);
    if (v14)
    {
      v15 = *(void **)(a1 + 48);
      if (v15)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_9;
        v16[3] = &unk_24E79C2B8;
        v18 = v15;
        v17 = v13;
        dispatch_async(v14, v16);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_closeWithError:", v13);

    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 32), "_setupSAPSessionWithCompletionQueue:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 52, *(_QWORD *)(a1 + 32), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __67__HMDFairPlaySAPSession_openWithCompletionQueue_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
