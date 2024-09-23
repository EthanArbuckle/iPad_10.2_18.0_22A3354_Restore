@implementation HAP2AccessoryServerPairingDriverPairSetupWorkItem

- (HAP2AccessoryServerPairingDriverPairSetupWorkItem)initWithPairSetupType:(unint64_t)a3
{
  HAP2AccessoryServerPairingDriverPairSetupWorkItem *v4;
  HAP2AccessoryServerPairingDriverPairSetupWorkItem *v5;
  HAP2AccessoryServerPairingDriverPairSetupWorkItem *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HAP2AccessoryServerPairingDriverPairSetupWorkItem;
  v4 = -[HAP2AccessoryServerPairingDriverPairSetupWorkItem init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_pairSetupType = a3;
    v6 = v4;
  }

  return v5;
}

- (void)runForPairingDriver:(id)a3
{
  id v4;
  void *v5;
  HAP2AccessoryServerTransport *v6;
  HAP2AccessoryServerTransport *transport;
  HAPPairSetupSession *v8;
  HAPPairSetupSession *pairingSession;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_delegate, v5);

  objc_msgSend(v4, "transport");
  v6 = (HAP2AccessoryServerTransport *)objc_claimAutoreleasedReturnValue();

  transport = self->_transport;
  self->_transport = v6;

  v8 = -[HAPPairSetupSession initWithRole:pairSetupType:delegate:]([HAPPairSetupSession alloc], "initWithRole:pairSetupType:delegate:", 0, -[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupType](self, "pairSetupType"), self);
  pairingSession = self->_pairingSession;
  self->_pairingSession = v8;

  -[HAP2AccessoryServerPairingDriverWorkItem pairingActivity](self, "pairingActivity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupType](self, "pairSetupType"));

  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairingSession](self, "pairingSession");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");

}

- (void)cancelWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__HAP2AccessoryServerPairingDriverPairSetupWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_resetPairingState
{
  void *v3;

  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem setPairingSession:](self, "setPairingSession:", 0);
  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem setInvalidSetupCode:](self, "setInvalidSetupCode:", 0);
  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem setBackoffInterval:](self, "setBackoffInterval:", 0.0);
  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem setCancelError:](self, "setCancelError:", 0);
}

- (void)_pairingStoppedWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverPairSetupWorkItem _resetPairingState](self, "_resetPairingState");
  -[HAP2AccessoryServerPairingDriverWorkItem finishWithError:](self, "finishWithError:", v5);

}

- (NSString)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HAP2AccessoryServerPairingDriverPairSetupWorkItem;
  -[HAP2AccessoryServerPairingDriverWorkItem description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HAP2AccessoryServerPairingDriverPairSetupWorkItem pairSetupType](self, "pairSetupType");
  if (v5 > 7)
    v6 = &stru_1E894EFE8;
  else
    v6 = off_1E894C098[v5];
  v7 = v6;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)pairSetupSession:(id)a3 didPairWithPeer:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  void *v22;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  _BYTE *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v10 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "Request to save pairing peer: %@", buf, 0xCu);
  }
  objc_msgSend(v9, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11 || !v12)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v20 = 0;
      *a5 = v21;
      goto LABEL_24;
    }
LABEL_19:
    v20 = 0;
    goto LABEL_24;
  }
  objc_msgSend(v12, "deviceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deviceIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if ((v17 & 1) == 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v22 = (void *)hap2Log_default;
    if (os_log_type_enabled((os_log_t)hap2Log_default, OS_LOG_TYPE_ERROR))
    {
      v24 = v22;
      objc_msgSend(v13, "deviceID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      _os_log_error_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "The peer's identifier doesn't match any more %@ -> %@", buf, 0x16u);

    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v18 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v32 = __Block_byref_object_copy__23477;
  v33 = __Block_byref_object_dispose__23478;
  v34 = 0;
  dispatch_group_enter(v18);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didPairWithPeer_error___block_invoke;
  v28[3] = &unk_1E894DF60;
  v19 = v18;
  v29 = v19;
  v30 = buf;
  objc_msgSend(v11, "pairingDriver:didSaveRemotePairingIdentity:completion:", v9, v8, v28);
  if (dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL))
  {
    v20 = 0;
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v20 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_24:

  return v20;
}

- (id)pairSetupSession:(id)a3 didReceiveLocalPairingIdentityRequestWithError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = dispatch_group_create();
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__23477;
    v27 = __Block_byref_object_dispose__23478;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__23477;
    v21 = __Block_byref_object_dispose__23478;
    v22 = 0;
    dispatch_group_enter(v9);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __117__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveLocalPairingIdentityRequestWithError___block_invoke;
    v13[3] = &unk_1E894DF88;
    v10 = v9;
    v14 = v10;
    v15 = &v23;
    v16 = &v17;
    objc_msgSend(v8, "pairingDriver:didRequestLocalPairingIdentityWithCompletion:", v7, v13);
    if (dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL))
    {
      v11 = 0;
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease((id)v18[5]);
      v11 = (id)v24[5];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 6);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)pairSetupSession:(id)a3 didReceiveSetupExchangeData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairSetupSession:(id)a3 didReceiveProductData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveProductData___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairSetupSessionDidStart:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidStart___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)pairSetupSession:(id)a3 didStopWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didStopWithError___block_invoke;
  v11[3] = &unk_1E894DFD8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "addBlock:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)pairSetupSession:(id)a3 didReceiveSetupCodeRequestWithCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E894E028;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairSetupSessionDidReceiveInvalidSetupCode:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke;
  v6[3] = &unk_1E894E050;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "addBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (BOOL)pairSetupSession:(id)a3 didReceiveBackoffRequestWithTimeInterval:(double)a4
{
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10[2];
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke;
  v9[3] = &unk_1E894E078;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a4;
  objc_msgSend(v7, "addBlock:", v9);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return 0;
}

- (HAP2AccessoryServerPairingDriverDelegate)delegate
{
  return (HAP2AccessoryServerPairingDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (HAP2AccessoryServerTransport)transport
{
  return self->_transport;
}

- (HAPPairSetupSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingSession, a3);
}

- (unint64_t)pairSetupType
{
  return self->_pairSetupType;
}

- (BOOL)isInvalidSetupCode
{
  return self->_invalidSetupCode;
}

- (void)setInvalidSetupCode:(BOOL)a3
{
  self->_invalidSetupCode = a3;
}

- (double)backoffInterval
{
  return self->_backoffInterval;
}

- (void)setBackoffInterval:(double)a3
{
  self->_backoffInterval = a3;
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (void)setCancelError:(id)a3
{
  objc_storeStrong((id *)&self->_cancelError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __111__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveBackoffRequestWithTimeInterval___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setBackoffInterval:", *(double *)(a1 + 40));
  objc_msgSend(WeakRetained, "setInvalidSetupCode:", 1);

}

void __96__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidReceiveInvalidSetupCode___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setBackoffInterval:", 0.0);
  objc_msgSend(WeakRetained, "setInvalidSetupCode:", 1);

}

void __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pairingDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke_2;
      v12 = &unk_1E894E000;
      v13 = WeakRetained;
      v14 = *(id *)(a1 + 32);
      v6 = (void *)MEMORY[0x1D17B7400](&v9);
      if (objc_msgSend(WeakRetained, "isInvalidSetupCode", v9, v10, v11, v12, v13))
      {
        objc_msgSend(WeakRetained, "backoffInterval");
        objc_msgSend(v5, "pairingDriver:didRejectSetupCodeForAccessory:backoffInterval:completion:", v3, v4, v6);
      }
      else
      {
        objc_msgSend(v5, "pairingDriver:doesRequireSetupCodeForAccessory:completion:", v3, v4, v6);
      }

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
}

void __118__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupCodeRequestWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "cancelError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInvalidSetupCode:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setBackoffInterval:", 0.0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __87__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didStopWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pairingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
    objc_msgSend(WeakRetained, "_pairingStoppedWithError:", *(_QWORD *)(a1 + 40));

}

void __78__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSessionDidStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "pairingDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPairingSession:", v2);

}

void __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveProductData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v9 = 138412546;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%@ Received product data: %@", (uint8_t *)&v9, 0x16u);
  }
  objc_msgSend(WeakRetained, "pairingDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryServer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFA375B0))
  {
    objc_msgSend(WeakRetained, "pairingDriver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "setProductData:", *(_QWORD *)(a1 + 32));
}

void __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wellKnownEndpoint:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mimeTypeForWellKnownEndpoint:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:]([HAP2AccessoryServerTransportRequest alloc], "initForWritingWithEndpoint:data:encrypted:mimeType:", v5, *(_QWORD *)(a1 + 32), 0, v7);
  HAPPairingStateFromData(*(void **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke_2;
  v12[3] = &unk_1E894DFB0;
  objc_copyWeak(&v14, v2);
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "sendRequest:completion:", v8, v12);

  objc_destroyWeak(&v14);
}

void __98__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveSetupExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (v5)
      {
        objc_msgSend(v7, "pairingActivity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "domain");

        objc_msgSend(v5, "code");
      }
      objc_msgSend(v7, "pairingSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "receivedSetupExchangeData:error:", v11, v5);

    }
  }

}

void __117__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didReceiveLocalPairingIdentityRequestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __92__HAP2AccessoryServerPairingDriverPairSetupWorkItem_pairSetupSession_didPairWithPeer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __69__HAP2AccessoryServerPairingDriverPairSetupWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "maybePairingDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "setCancelError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "pairingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "stop");

  }
}

+ (id)pairSetupWithType:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithPairSetupType:", a3);
}

@end
