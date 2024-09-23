@implementation HAP2AccessoryServerSecureTransportPairVerify

- (HAP2AccessoryServerSecureTransportPairVerify)initWithTransport:(id)a3 operationQueue:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  HAP2AccessoryServerSecureTransportPairVerify *v11;
  HAP2AccessorySessionInfo *sessionInfo;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v8 = (const char *)HAPDispatchQueueName(self, CFSTR("delegateQueue"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = dispatch_queue_create(v8, v9);

  v14.receiver = self;
  v14.super_class = (Class)HAP2AccessoryServerSecureTransportPairVerify;
  v11 = -[HAP2AccessoryServerSecureTransportBase initWithOperationQueue:delegateQueue:transport:](&v14, sel_initWithOperationQueue_delegateQueue_transport_, v7, v10, v6);

  if (v11)
  {
    objc_msgSend(v6, "setDelegate:", v11);
    sessionInfo = v11->_sessionInfo;
    v11->_sessionInfo = 0;

  }
  return v11;
}

- (HAPSecuritySession)securitySession
{
  void *v3;

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_securitySession;
}

- (void)setSecuritySession:(id)a3
{
  HAPSecuritySession *v4;
  void *v5;
  HAPSecuritySession *securitySession;

  v4 = (HAPSecuritySession *)a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  securitySession = self->_securitySession;
  self->_securitySession = v4;

}

- (void)doOpenWithCompletion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportPairVerify setStateChangeCompletion:](self, "setStateChangeCompletion:", v4);
  -[HAP2AccessoryServerSecureTransportPairVerify _openTransport](self, "_openTransport");
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportPairVerify setStateChangeCompletion:](self, "setStateChangeCompletion:", v6);
  -[HAP2AccessoryServerSecureTransportPairVerify _closeWithError:](self, "_closeWithError:", v8);

}

- (id)securitySession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  HAP2AccessoryServerSecureTransportPairVerify *v18;
  NSObject *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = dispatch_group_create();
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5044;
  v32 = __Block_byref_object_dispose__5045;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5044;
  v26 = __Block_byref_object_dispose__5045;
  v27 = 0;
  dispatch_group_enter(v7);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke;
  v17 = &unk_1E894B250;
  v18 = self;
  v20 = &v22;
  v8 = v7;
  v19 = v8;
  v21 = &v28;
  v9 = (void *)MEMORY[0x1D17B7400](&v14);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v14, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConcurrentBlock:", v9);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (void *)v29[5];
  if (v11)
  {
    v12 = v11;
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease((id)v23[5]);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v11;
}

- (id)securitySession:(id)a3 didReceiveRequestForPeerPairingIdentityWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HAPDeviceID *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  NSObject *v19;
  HAPDeviceID *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v9);
  if (v10)
  {
    v11 = dispatch_group_create();
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__5044;
    v33 = __Block_byref_object_dispose__5045;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__5044;
    v27 = __Block_byref_object_dispose__5045;
    v28 = 0;
    dispatch_group_enter(v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke;
    v18[3] = &unk_1E894BEA8;
    v18[4] = self;
    v21 = &v23;
    v12 = v11;
    v19 = v12;
    v20 = v10;
    v22 = &v29;
    v13 = (void *)MEMORY[0x1D17B7400](v18);
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addConcurrentBlock:", v13);

    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    v15 = (void *)v30[5];
    if (v15)
    {
      v16 = v15;
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease((id)v24[5]);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)securitySession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  HAP2AccessoryServerSecureTransportPairVerify *v13;
  id v14;

  v5 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __92__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveSetupExchangeData___block_invoke;
  v12 = &unk_1E894E0F8;
  v13 = self;
  v14 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D17B7400](&v9);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addConcurrentBlock:", v7);

}

- (void)securitySessionDidOpen:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HAP2AccessoryServerSecureTransportPairVerify *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __71__HAP2AccessoryServerSecureTransportPairVerify_securitySessionDidOpen___block_invoke;
  v11 = &unk_1E894E0F8;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addConcurrentBlock:", v6);

}

- (void)securitySession:(id)a3 didCloseWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  HAP2AccessoryServerSecureTransportPairVerify *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke;
  v12[3] = &unk_1E894E120;
  v13 = v6;
  v14 = self;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17B7400](v12);
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addConcurrentBlock:", v10);

}

- (void)_openTransport
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke;
  v5[3] = &unk_1E894DD30;
  v5[4] = self;
  objc_msgSend(v4, "openWithCompletion:", v5);

}

- (void)_secureTransport
{
  void *v3;
  HAPSecuritySession *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  v4 = -[HAPSecuritySession initWithRole:resumeSessionID:delegate:]([HAPSecuritySession alloc], "initWithRole:resumeSessionID:delegate:", 0, 0, self);
  -[HAP2AccessoryServerSecureTransportPairVerify setSecuritySession:](self, "setSecuritySession:", v4);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Secure Transport: Opening security session", v6, 2u);
  }
  -[HAPSecuritySession open](v4, "open");

}

- (void)_sendSetupExchangeData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];

  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wellKnownEndpoint:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mimeTypeForWellKnownEndpoint:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:]([HAP2AccessoryServerTransportRequest alloc], "initForWritingWithEndpoint:data:encrypted:mimeType:", v7, v4, 0, v9);
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke;
  v12[3] = &unk_1E894A4A8;
  v12[4] = self;
  objc_msgSend(v11, "sendRequest:completion:", v10, v12);

}

- (void)_closeWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportPairVerify securitySession](self, "securitySession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HAP2AccessoryServerSecureTransportPairVerify setSecuritySession:](self, "setSecuritySession:", 0);
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "Secure Transport: Closing security session", buf, 2u);
    }
    objc_msgSend(v6, "close");
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "Secure Transport: Closing transport", buf, 2u);
  }
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke;
  v10[3] = &unk_1E894DD30;
  v10[4] = self;
  objc_msgSend(v9, "closeWithError:completion:", v4, v10);

}

- (id)stateChangeCompletion
{
  return self->_stateChangeCompletion;
}

- (void)setStateChangeCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (HAP2AccessorySessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong(&self->_stateChangeCompletion, 0);
  objc_storeStrong((id *)&self->_securitySession, 0);
}

void __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke_2;
  v13[3] = &unk_1E894E120;
  v8 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = v8;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  v11 = (void *)MEMORY[0x1D17B7400](v13);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addConcurrentBlock:", v11);

}

void __64__HAP2AccessoryServerSecureTransportPairVerify__closeWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to close transport: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "Secure Transport: Closed transport", (uint8_t *)&v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 40), "stateChangeCompletion");
  v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setStateChangeCompletion:", 0);
  if (v5)
    v5[2](v5, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke_2;
  v11[3] = &unk_1E894E120;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17B7400](v11);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConcurrentBlock:", v9);

}

void __71__HAP2AccessoryServerSecureTransportPairVerify__sendSetupExchangeData___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "securitySession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedSetupExchangeData:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke_2;
  v17 = &unk_1E894A480;
  v9 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v19 = v9;
  v21 = a2;
  v20 = v7;
  v10 = v7;
  v11 = v8;
  v12 = (void *)MEMORY[0x1D17B7400](&v14);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConcurrentBlock:", v12);

}

void __62__HAP2AccessoryServerSecureTransportPairVerify__openTransport__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  HAP2AccessorySessionInfo *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v2 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_error_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to open transport: %@", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "stateChangeCompletion");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setStateChangeCompletion:", 0);
    if (v3)
      v3[2](v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v4 = -[HAP2AccessorySessionInfo initWithNumIPs:numIPsTried:numBonjourNames:]([HAP2AccessorySessionInfo alloc], "initWithNumIPs:numIPsTried:numBonjourNames:", objc_msgSend(*(id *)(a1 + 48), "numIPAddresses"), objc_msgSend(*(id *)(a1 + 48), "numIPAddressesTried"), objc_msgSend(*(id *)(a1 + 48), "numBonjourNames"));
      objc_msgSend(*(id *)(a1 + 40), "setSessionInfo:", v4);

    }
    objc_msgSend(*(id *)(a1 + 40), "_secureTransport");
  }
}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "securitySession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v6 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "Secure Transport: Security session closed with error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Secure Transport: Security session closed", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setEncryptedSession:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setSecuritySession:", 0);
    objc_msgSend(*(id *)(a1 + 40), "stateChangeCompletion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setStateChangeCompletion:", 0);
    if (v7)
    {
      v8 = *(void **)(a1 + 48);
      if (v8)
      {
        v9 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "Secure Transport: Failed to open security session: %@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 40), "transport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_6;
      v14[3] = &unk_1E894A438;
      v14[4] = *(_QWORD *)(a1 + 40);
      v15 = v10;
      v16 = v7;
      v13 = v10;
      objc_msgSend(v12, "closeWithError:completion:", v13, v14);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "closeWithError:completion:", *(_QWORD *)(a1 + 48), &__block_literal_global_5041);
    }

  }
}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_6(id *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  char v13;

  v5 = a3;
  objc_msgSend(a1[4], "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_2;
  v9[3] = &unk_1E894CF58;
  v7 = a1[6];
  v13 = a2;
  v12 = v7;
  v10 = v5;
  v11 = a1[5];
  v8 = v5;
  objc_msgSend(v6, "addConcurrentBlock:", v9);

}

void __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v0 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CCE01000, v0, OS_LOG_TYPE_INFO, "Secure Transport: Finished force closing", v1, 2u);
  }
}

uint64_t __82__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didCloseWithError___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __71__HAP2AccessoryServerSecureTransportPairVerify_securitySessionDidOpen___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateChangeCompletion");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setStateChangeCompletion:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEncryptedSession:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "sessionInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v3 + 2))(v3, 0, v2, 0);

  }
}

uint64_t __92__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendSetupExchangeData:", *(_QWORD *)(a1 + 40));
}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  int8x16_t v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_5;
    v10[3] = &unk_1E894A410;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v11 = v4;
    v12 = v5;
    v13 = *(id *)(a1 + 48);
    v15 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    v14 = *(id *)(a1 + 40);
    dispatch_async(v3, v10);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "Secure Transport: No delegate", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_5(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_2;
  v6[3] = &unk_1E894DF88;
  v8 = *(_QWORD *)(a1 + 72);
  v5 = *(_OWORD *)(a1 + 56);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v1, "secureTransport:needsRemotePairingIdentityForDeviceID:completion:", v2, v3, v6);

}

void __124__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveRequestForPeerPairingIdentityWithIdentifier_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  int8x16_t v15;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_1;
    block[3] = &unk_1E894BEA8;
    v4 = v2;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v12 = v4;
    v13 = v5;
    v15 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    v14 = v6;
    dispatch_async(v3, block);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "Secure Transport: No delegate", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_2;
  v5[3] = &unk_1E894DF88;
  v7 = *(_QWORD *)(a1 + 64);
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v1, "secureTransport:needsLocalPairingIdentityWithCompletion:", v2, v5);

}

void __111__HAP2AccessoryServerSecureTransportPairVerify_securitySession_didReceiveLocalPairingIdentityRequestWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
