@implementation HAP2AccessoryServerSecureTransportBase

- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5 encryptedSession:(id)a6
{
  id v11;
  id v12;
  HAP2AccessoryServerSecureTransportBase *v13;
  HAP2AccessoryServerSecureTransportBase *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HAP2AccessoryServerSecureTransportBase;
  v13 = -[HAP2AccessoryServerTransportBase initWithOperationQueue:delegateQueue:](&v16, sel_initWithOperationQueue_delegateQueue_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_transport, a5);
    objc_storeStrong((id *)&v14->_encryptedSession, a6);
    objc_msgSend(v11, "setDelegate:", v14);
  }

  return v14;
}

- (HAP2AccessoryServerSecureTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4 transport:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HAP2AccessoryServerSecureTransportBase *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultEncryptedSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HAP2AccessoryServerSecureTransportBase initWithOperationQueue:delegateQueue:transport:encryptedSession:](self, "initWithOperationQueue:delegateQueue:transport:encryptedSession:", v10, v9, v8, v11);

  return v12;
}

- (HAP2AccessoryServerSecureTransportDelegate)delegate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10047;
  v11 = __Block_byref_object_dispose__10048;
  v12 = 0;
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__HAP2AccessoryServerSecureTransportBase_delegate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerSecureTransportDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__HAP2AccessoryServerSecureTransportBase_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (HAPEncryptedSession)encryptedSession
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__10047;
  v11 = __Block_byref_object_dispose__10048;
  v12 = 0;
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__HAP2AccessoryServerSecureTransportBase_encryptedSession__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAPEncryptedSession *)v4;
}

- (void)setEncryptedSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend((id)objc_opt_class(), "defaultEncryptedSession");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__HAP2AccessoryServerSecureTransportBase_setEncryptedSession___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (unint64_t)protocolFeaturesForVersion:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "protocolFeaturesForVersion:", v4);

  return v6;
}

- (id)wellKnownEndpoint:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wellKnownEndpoint:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endpointForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointForCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)endpointForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endpointForCharacteristics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mimeTypeForWellKnownEndpoint:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)mimeTypeForCharacteristicRequests
{
  void *v2;
  void *v3;

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mimeTypeForCharacteristicRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)mergeWithNewTransport:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mergeWithNewTransport:", v4);

  return v6;
}

- (void)didChangeStateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  HAP2AccessoryServerSecureTransportBase *v11;
  id v12;
  unint64_t v13;

  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[HAP2AccessoryServerTransportBase state](self, "state");
    -[HAP2AccessoryServerTransportBase delegateQueue](self, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__HAP2AccessoryServerSecureTransportBase_didChangeStateWithError___block_invoke;
    v9[3] = &unk_1E894DF10;
    v10 = v6;
    v11 = self;
    v13 = v7;
    v12 = v4;
    dispatch_async(v8, v9);

  }
}

- (void)doOpenWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke;
  v8[3] = &unk_1E894CC98;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "openWithCompletion:", v8);

}

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase _encryptRequest:completion:](self, "_encryptRequest:completion:", v8, v6);
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke;
  v11[3] = &unk_1E894CC98;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "closeWithError:completion:", v7, v11);

}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  void *v5;
  id v6;

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateMaxRequestTimeout:", a3);

}

- (id)encryptData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase encryptedSession](self, "encryptedSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encryptData:additionalAuthenticatedData:error:", v6, 0, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decryptData:(id)a3 type:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase encryptedSession](self, "encryptedSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "decryptData:additionalAuthenticatedData:error:", v7, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)transport:(id)a3 didChangeState:(unint64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  HAP2AccessoryServerSecureTransportBase *v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_accessory;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412802;
        v14 = self;
        v15 = 2048;
        v16 = a4;
        v17 = 2112;
        v18 = v8;
        _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Transport state changed to %lu with error: %@", (uint8_t *)&v13, 0x20u);
      }
      if (a4 == 3 || !a4)
        -[HAP2AccessoryServerTransportBase didDisconnectWithError:](self, "didDisconnectWithError:", v8);
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = self;
      v15 = 2048;
      v16 = a4;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "%@ (SecureBase) Transport state changed to %lu", (uint8_t *)&v13, 0x16u);
    }
  }

}

- (void)transport:(id)a3 didReceiveEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HAP2AccessoryServerSecureTransportBase *v17;
  id v18;
  uint8_t buf[4];
  HAP2AccessoryServerSecureTransportBase *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_debug_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEBUG, "%@ (SecureBase) Received an event", buf, 0xCu);
    }
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke;
    v16 = &unk_1E894E0F8;
    v17 = self;
    v18 = v6;
    v11 = (void *)MEMORY[0x1D17B7400](&v13);
    -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue", v13, v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBlock:", v11);

  }
}

- (void)_encryptRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  int v13;
  HAP2AccessoryServerTransportRequest *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  HAP2AccessoryServerSecureTransportBase *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  LODWORD(v8) = objc_msgSend(v6, "isEncrypted");
  objc_msgSend(v6, "data");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!(_DWORD)v8)
  {
    v12 = (id)v9;
    goto LABEL_5;
  }
  v21 = 0;
  -[HAP2AccessoryServerSecureTransportBase encryptData:error:](self, "encryptData:error:", v9, &v21);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v21;

  if (v11)
  {

    v12 = (id)v11;
LABEL_5:
    v13 = objc_msgSend(v6, "isForReading");
    v14 = [HAP2AccessoryServerTransportRequest alloc];
    objc_msgSend(v6, "endpoint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "isEncrypted");
    objc_msgSend(v6, "mimeType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      v18 = -[HAP2AccessoryServerTransportRequest initForReadingWithEndpoint:data:encrypted:mimeType:](v14, "initForReadingWithEndpoint:data:encrypted:mimeType:", v15, v12, v16, v17);
    else
      v18 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:](v14, "initForWritingWithEndpoint:data:encrypted:mimeType:", v15, v12, v16, v17);
    v19 = (void *)v18;

    -[HAP2AccessoryServerSecureTransportBase _sendRequest:completion:](self, "_sendRequest:completion:", v19, v7);
    goto LABEL_9;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v20 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v23 = self;
    v24 = 2112;
    v25 = v12;
    _os_log_error_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to encrypt request: %@", buf, 0x16u);
  }
  v7[2](v7, 0, v12);
LABEL_9:

}

- (void)_sendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertCurrentQueue");

  -[HAP2AccessoryServerSecureTransportBase transport](self, "transport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke;
  v12[3] = &unk_1E894CAD8;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "sendRequest:completion:", v10, v12);

}

- (void)_decryptResponse:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id, _QWORD);
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  HAP2AccessoryServerSecureTransportBase *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, id, _QWORD))a5;
  v10 = a4;
  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assertCurrentQueue");

  LODWORD(v11) = objc_msgSend(v10, "isEncrypted");
  if (!(_DWORD)v11)
  {
    v12 = v8;
    v13 = 0;
    goto LABEL_9;
  }
  v15 = 0;
  -[HAP2AccessoryServerSecureTransportBase decryptData:type:error:](self, "decryptData:type:error:", v8, 0, &v15);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  if (v12)
  {
LABEL_9:
    v9[2](v9, v12, 0);

    goto LABEL_10;
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v14 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v17 = self;
    v18 = 2112;
    v19 = v13;
    _os_log_error_impl(&dword_1CCE01000, v14, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to decrypt response: %@", buf, 0x16u);
  }
  ((void (**)(id, id, id))v9)[2](v9, 0, v13);
LABEL_10:

}

- (HAP2AccessoryServerTransport)transport
{
  return self->_transport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encryptedSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to send request: %@", buf, 0x16u);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke_4;
    v14 = &unk_1E894D6D0;
    v15 = a1[4];
    v18 = a1[6];
    v16 = v5;
    v17 = a1[5];
    v8 = (void *)MEMORY[0x1D17B7400](&v11);
    objc_msgSend(a1[4], "operationQueue", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addConcurrentBlock:", v8);

  }
}

void __66__HAP2AccessoryServerSecureTransportBase__sendRequest_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_decryptResponse:request:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v2 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_DEFAULT, "%@ (SecureBase) No longer open after sending request", (uint8_t *)&v6, 0xCu);
    }
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
}

void __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v20 = 0;
    objc_msgSend(v2, "decryptData:type:error:", v3, 1, &v20);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v20;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        v14 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v22 = v14;
        _os_log_debug_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%@ (SecureBase) Successfully decrypted event", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke_2;
        v16[3] = &unk_1E894E120;
        v9 = v7;
        v10 = *(_QWORD *)(a1 + 32);
        v17 = v9;
        v18 = v10;
        v19 = v4;
        dispatch_async(v8, v16);

      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v22 = v15;
      v23 = 2112;
      v24 = (uint64_t)v5;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%@ (SecureBase) Failed to decrypt event: %@", buf, 0x16u);
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2048;
      v24 = objc_msgSend(v12, "state");
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%@ (SecureBase) Ignoring event while in the wrong state: %lu", buf, 0x16u);

    }
  }
}

uint64_t __68__HAP2AccessoryServerSecureTransportBase_transport_didReceiveEvent___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secureTransport:didReceiveEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke_2;
  v17 = &unk_1E894CF58;
  v9 = *(id *)(a1 + 40);
  v19 = v8;
  v20 = v9;
  v21 = a2;
  v18 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void *)MEMORY[0x1D17B7400](&v14);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConcurrentBlock:", v12);

}

uint64_t __70__HAP2AccessoryServerSecureTransportBase_doCloseWithError_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a3;
  v8 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke_2;
  v17 = &unk_1E894CF58;
  v9 = *(id *)(a1 + 40);
  v19 = v8;
  v20 = v9;
  v21 = a2;
  v18 = v7;
  v10 = v8;
  v11 = v7;
  v12 = (void *)MEMORY[0x1D17B7400](&v14);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addConcurrentBlock:", v12);

}

uint64_t __63__HAP2AccessoryServerSecureTransportBase_doOpenWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __66__HAP2AccessoryServerSecureTransportBase_didChangeStateWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "secureTransport:didChangeState:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __62__HAP2AccessoryServerSecureTransportBase_setEncryptedSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

void __58__HAP2AccessoryServerSecureTransportBase_encryptedSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

id __54__HAP2AccessoryServerSecureTransportBase_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
}

void __50__HAP2AccessoryServerSecureTransportBase_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

+ (id)defaultEncryptedSession
{
  return (id)objc_opt_new();
}

@end
