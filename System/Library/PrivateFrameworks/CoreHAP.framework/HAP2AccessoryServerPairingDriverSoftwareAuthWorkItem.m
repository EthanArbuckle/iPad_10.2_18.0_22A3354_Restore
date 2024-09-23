@implementation HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem

+ (id)doSoftwareAuth
{
  return (id)objc_opt_new();
}

- (void)runForPairingDriver:(id)a3
{
  id v4;
  HAP2AccessoryServerEncoding *v5;
  HAP2AccessoryServerEncoding *encoding;
  HAPPairSetupSession *v7;
  HAPPairSetupSession *pairingSession;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HAP2AccessoryServerSecureTransport *v15;
  HAP2AccessoryServerSecureTransport *transport;
  void *v17;
  HAPAuthSession *v18;
  void *v19;
  _QWORD v20[5];

  v4 = a3;
  objc_msgSend(v4, "encoding");
  v5 = (HAP2AccessoryServerEncoding *)objc_claimAutoreleasedReturnValue();
  encoding = self->_encoding;
  self->_encoding = v5;

  objc_msgSend(v4, "pairingSession");
  v7 = (HAPPairSetupSession *)objc_claimAutoreleasedReturnValue();
  pairingSession = self->_pairingSession;
  self->_pairingSession = v7;

  objc_msgSend(v4, "encoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sendPDUHeader = (objc_msgSend(v9, "encodingFeatures") & 8) != 0;

  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem pairingSession](self, "pairingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateSessionKeys");

  objc_msgSend(v4, "secureTransportFactory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem pairingSession](self, "pairingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createSecureTransportWithTransport:isPaired:encryptedSession:", v13, 0, v14);
  v15 = (HAP2AccessoryServerSecureTransport *)objc_claimAutoreleasedReturnValue();
  transport = self->_transport;
  self->_transport = v15;

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem authSession](self, "authSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem authSession](self, "authSession");
    v18 = (HAPAuthSession *)objc_claimAutoreleasedReturnValue();
    -[HAPAuthSession resetSession](v18, "resetSession");
  }
  else
  {
    v18 = -[HAPAuthSession initWithRole:instanceId:delegate:]([HAPAuthSession alloc], "initWithRole:instanceId:delegate:", 0, &unk_1E8989830, self);
    -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem setAuthSession:](self, "setAuthSession:", v18);
  }

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem transport](self, "transport");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke;
  v20[3] = &unk_1E894DD30;
  v20[4] = self;
  objc_msgSend(v19, "openWithCompletion:", v20);

}

- (void)_startSoftwareAuth
{
  void *v3;
  _QWORD v4[5];

  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__startSoftwareAuth__block_invoke;
  v4[3] = &unk_1E894DD58;
  v4[4] = self;
  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem _validateAccessoryInfoWithCompletion:](self, "_validateAccessoryInfoWithCompletion:", v4);
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
  v7[2] = __72__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_cancelWithError___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_softwareAuthFinished
{
  void *v3;

  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverWorkItem finishWithError:](self, "finishWithError:", 0);
}

- (void)_sendSoftwareAuthMessageWithData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem transport](self, "transport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wellKnownEndpoint:", 4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem transport](self, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mimeTypeForWellKnownEndpoint:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:]([HAP2AccessoryServerTransportRequest alloc], "initForWritingWithEndpoint:data:encrypted:mimeType:", v13, v7, 1, v10);
  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem transport](self, "transport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendRequest:completion:", v11, v6);

}

- (void)_validateAccessoryInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  char v15;
  uint8_t buf[4];
  HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  v15 = 0;
  +[HAPProtocolMessages constructInfoRequest:outTID:](HAPProtocolMessages, "constructInfoRequest:outTID:", &unk_1E8989830, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = self;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Attempting to validate accessory info", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke;
    v10[3] = &unk_1E894DDA8;
    objc_copyWeak(&v13, (id *)buf);
    v9 = v8;
    v11 = v9;
    v12 = v4;
    v14 = v15;
    -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem _sendSoftwareAuthMessageWithData:completion:](self, "_sendSoftwareAuthMessageWithData:completion:", v6, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v4 + 2))(v4, v9);
  }

}

- (BOOL)_isProtocolInfoValid:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  int v26;
  NSObject *log;
  uint8_t buf[4];
  HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      log = v8;
      objc_msgSend(v7, "deviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "deviceIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v7, "category");
      v11 = objc_msgSend(v4, "categoryIdentifier");
      objc_msgSend(v7, "protocolVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "protocolVersion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138414338;
      v29 = self;
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v10;
      v34 = 1024;
      v35 = v26;
      v36 = 1024;
      v37 = v11;
      v38 = 2112;
      v39 = v12;
      v40 = 2112;
      v41 = v13;
      v42 = 1024;
      v43 = objc_msgSend(v14, "featureFlags");
      v44 = 1024;
      v45 = objc_msgSend(v4, "featureFlags");
      _os_log_impl(&dword_1CCE01000, log, OS_LOG_TYPE_INFO, "%@ Matching device ID: %@/%@ category: %d/%d protocol version: %@/%@ feature flags: %x/%x", buf, 0x4Cu);

    }
    objc_msgSend(v7, "deviceID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", v17)
      && (v18 = objc_msgSend(v7, "category"), v18 == objc_msgSend(v4, "categoryIdentifier")))
    {
      objc_msgSend(v7, "protocolVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "majorVersion");
      objc_msgSend(v4, "protocolVersion");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == objc_msgSend(v21, "majorVersion"))
      {
        -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "featureFlags");
        v24 = v23 == objc_msgSend(v4, "featureFlags");

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_handleAuthCompleteWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  -[HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem setAuthSession:](self, "setAuthSession:", 0);
  -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "pairingDriver:didFinishAuthWithError:", v5, v8);

}

- (void)authSession:(id)a3 authComplete:(id)a4
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
  v10[2] = __81__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authComplete___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)authSession:(id)a3 authenticateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke;
  v14[3] = &unk_1E894DFD8;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)authSession:(id)a3 confirmUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke;
  v14[3] = &unk_1E894DFD8;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)authSession:(id)a3 sendAuthExchangeData:(id)a4
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
  v10[2] = __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)authSession:(id)a3 validateUUID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke;
  v14[3] = &unk_1E894DFD8;
  objc_copyWeak(&v17, &location);
  v12 = v9;
  v15 = v12;
  v13 = v10;
  v16 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (HAP2AccessoryServerSecureTransport)transport
{
  return self->_transport;
}

- (HAP2AccessoryServerEncoding)encoding
{
  return self->_encoding;
}

- (HAPPairSetupSession)pairingSession
{
  return self->_pairingSession;
}

- (void)setPairingSession:(id)a3
{
  objc_storeStrong((id *)&self->_pairingSession, a3);
}

- (HAPAccessoryProtocolInfo)authenticatedProtocolInfo
{
  return self->_authenticatedProtocolInfo;
}

- (void)setAuthenticatedProtocolInfo:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, a3);
}

- (NSError)cancelError
{
  return self->_cancelError;
}

- (void)setCancelError:(id)a3
{
  objc_storeStrong((id *)&self->_cancelError, a3);
}

- (HAPAuthSession)authSession
{
  return self->_authSession;
}

- (void)setAuthSession:(id)a3
{
  objc_storeStrong((id *)&self->_authSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authSession, 0);
  objc_storeStrong((id *)&self->_cancelError, 0);
  objc_storeStrong((id *)&self->_authenticatedProtocolInfo, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_transport, 0);
}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cancelError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(WeakRetained, "pairingDriver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(WeakRetained, "authenticatedProtocolInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "modelName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_2;
      v12[3] = &unk_1E894DDF8;
      objc_copyWeak(&v13, v2);
      objc_msgSend(v6, "pairingDriver:validateSoftwareAuthUUID:token:model:completion:", v5, v7, v8, v10, v12);

      objc_destroyWeak(&v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v11);

    }
  }

}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_3;
    v8[3] = &unk_1E894DF38;
    objc_copyWeak(&v10, v4);
    v9 = v3;
    objc_msgSend(v7, "addBlock:", v8);

    objc_destroyWeak(&v10);
  }

}

void __87__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_validateUUID_token___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "cancelWithError:");
  }
  else
  {
    objc_msgSend(WeakRetained, "authSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "continueAuthAfterValidation:", 1);

  }
}

void __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke_2;
    v6[3] = &unk_1E894DE20;
    objc_copyWeak(&v7, v2);
    objc_msgSend(WeakRetained, "_sendSoftwareAuthMessageWithData:completion:", v5, v6);
    objc_destroyWeak(&v7);
  }

}

void __89__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_sendAuthExchangeData___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  unsigned __int8 *WeakRetained;
  unsigned __int8 *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cancelError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      if (v5)
      {
        objc_msgSend(v7, "cancelWithError:", v5);
      }
      else
      {
        objc_msgSend(v7, "authSession");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleAuthExchangeData:withHeader:", v10, v7[32]);

      }
    }
  }

}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cancelError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(WeakRetained, "pairingDriver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_2;
      v10[3] = &unk_1E894DDF8;
      objc_copyWeak(&v11, v2);
      objc_msgSend(v6, "pairingDriver:confirmSoftwareAuthUUID:token:completion:", v5, v7, v8, v10);
      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v9);

    }
  }

}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      objc_msgSend(WeakRetained, "cancelWithError:", v3);
    }
    else
    {
      objc_msgSend(WeakRetained, "operationQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_3;
      v8[3] = &unk_1E894E050;
      objc_copyWeak(&v9, v4);
      objc_msgSend(v7, "addBlock:", v8);

      objc_destroyWeak(&v9);
    }
  }

}

void __86__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_confirmUUID_token___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_softwareAuthFinished");

}

void __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cancelError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(WeakRetained, "pairingDriver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke_2;
      v10[3] = &unk_1E894DDD0;
      objc_copyWeak(&v11, v2);
      objc_msgSend(v6, "pairingDriver:authenticateSoftwareAuthUUID:token:completion:", v5, v7, v8, v10);
      objc_destroyWeak(&v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "cancelWithError:", v9);

    }
  }

}

void __91__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authenticateUUID_token___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "authSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendTokenUpdateRequest:", v6);

  }
}

void __81__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_authSession_authComplete___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAuthCompleteWithError:", *(_QWORD *)(a1 + 32));

}

void __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v10 = v9;

    objc_msgSend(WeakRetained, "pairingActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    objc_msgSend(v6, "domain");

    objc_msgSend(v6, "code");
    objc_msgSend(WeakRetained, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke_2;
    v14[3] = &unk_1E894DD80;
    objc_copyWeak(&v18, (id *)(a1 + 48));
    v15 = v6;
    v17 = *(id *)(a1 + 40);
    v16 = v5;
    v19 = *(_BYTE *)(a1 + 56);
    objc_msgSend(v13, "addBlock:", v14);

    objc_destroyWeak(&v18);
  }

}

void __93__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__validateAccessoryInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void (*v4)(void);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "cancelError");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 || (v3 = *(id *)(a1 + 32)) != 0)
  {
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_6;
    +[HAPProtocolMessages parseInfoResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseInfoResponse:expectedTID:withHeader:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(WeakRetained, "_isProtocolInfoValid:", v3))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = WeakRetained;
        _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Accessory info didn't validate", (uint8_t *)&v8, 0xCu);
      }
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 7);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

      goto LABEL_5;
    }
    objc_msgSend(WeakRetained, "setAuthenticatedProtocolInfo:", v3);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v4();
LABEL_5:

LABEL_6:
}

void __72__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_cancelWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "cancelError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(WeakRetained, "setCancelError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "maybePairingDriver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(WeakRetained, "finishWithError:", *(_QWORD *)(a1 + 32));

  }
}

void __74__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem__startSoftwareAuth__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertCurrentQueue");

  objc_msgSend(*(id *)(a1 + 32), "cancelError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "cancelWithError:", v3);
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v6 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@ Starting the software auth state machine", (uint8_t *)&v12, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "authSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        v11 = *(unsigned __int8 *)(v10 + 32) != 0;
      else
        v11 = 0;
      objc_msgSend(v8, "handleAuthExchangeData:withHeader:", 0, v11);

    }
  }

}

void __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke_2;
  v4[3] = &unk_1E894DD08;
  v4[4] = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1D17B7400](v4);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addBlock:", v2);

}

uint64_t __76__HAP2AccessoryServerPairingDriverSoftwareAuthWorkItem_runForPairingDriver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSoftwareAuth");
}

@end
