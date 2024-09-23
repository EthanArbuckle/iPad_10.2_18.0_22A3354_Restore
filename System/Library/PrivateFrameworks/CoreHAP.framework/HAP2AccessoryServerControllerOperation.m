@implementation HAP2AccessoryServerControllerOperation

- (HAP2AccessoryServerControllerOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 request:(id)a7 endpoint:(id)a8 mimeType:(id)a9 timeout:(double)a10 options:(unint64_t)a11
{
  id v18;
  id v19;
  id v20;
  HAP2AccessoryServerControllerOperation *v21;
  HAP2AccessoryServerControllerOperation *v22;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v18 = a4;
  v26 = a5;
  v25 = a6;
  v24 = a7;
  v19 = a8;
  v20 = a9;
  v27.receiver = self;
  v27.super_class = (Class)HAP2AccessoryServerControllerOperation;
  v21 = -[HAP2AsynchronousOperation initWithName:](&v27, sel_initWithName_, a3);
  v22 = v21;
  if (v21)
  {
    objc_storeWeak((id *)&v21->_controller, v18);
    objc_storeStrong((id *)&v22->_encoding, a5);
    objc_storeStrong((id *)&v22->_transport, a6);
    objc_storeStrong((id *)&v22->_request, a7);
    objc_storeStrong((id *)&v22->_endpoint, a8);
    objc_storeStrong((id *)&v22->_mimeType, a9);
    v22->_timeout = a10;
    v22->_options = a11;
  }

  return v22;
}

- (void)main
{
  NSObject *v3;
  int v4;
  HAP2AccessoryServerControllerOperation *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&v4, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation _openTransport:](self, "_openTransport:", 0);
}

- (void)finish
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  HAP2AccessoryServerControllerOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v3 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_INFO, "%@ Finishing", buf, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation _cleanUp](self, "_cleanUp");
  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerControllerOperation;
  -[HAP2AsynchronousOperation finish](&v4, sel_finish);
}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  HAP2AccessoryServerControllerOperation *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Finishing: %@", buf, 0x16u);
  }
  -[HAP2AccessoryServerControllerOperation _cleanUp](self, "_cleanUp");
  v6.receiver = self;
  v6.super_class = (Class)HAP2AccessoryServerControllerOperation;
  -[HAP2AsynchronousOperation finishWithError:](&v6, sel_finishWithError_, v4);

}

- (void)cancel
{
  objc_super v3;

  -[HAP2AccessoryServerControllerOperation _cleanUp](self, "_cleanUp");
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServerControllerOperation;
  -[HAP2AsynchronousOperation cancel](&v3, sel_cancel);
}

- (void)cancelWithError:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[HAP2AccessoryServerControllerOperation _cleanUp](self, "_cleanUp");
  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerControllerOperation;
  -[HAP2AsynchronousOperation cancelWithError:](&v5, sel_cancelWithError_, v4);

}

- (void)_openTransport:(BOOL)a3
{
  unint64_t options;
  id *WeakRetained;
  char v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  HAP2AccessoryServerControllerOperation *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
    return;
  if (self)
  {
    options = self->_options;
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_controller);
    if ((options & 1) != 0)
    {
LABEL_14:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke;
      v14[3] = &unk_1E8949C00;
      v14[4] = self;
      -[HAP2AccessoryServerController openTransportWithResume:completion:](WeakRetained, a3, v14);

      return;
    }
  }
  else
  {
    WeakRetained = 0;
  }
  v7 = -[HAP2AccessoryServerController isSessionExpired]((uint64_t)WeakRetained);

  if ((v7 & 1) == 0)
  {
    -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.isa);
    WeakRetained = (id *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (self)
  {
    if ((self->_options & 2) != 0)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ Session has expired and operation is not allowed to refresh", buf, 0xCu);
      }
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = 1;
      goto LABEL_20;
    }
    if (self->_attemptedSessionRefresh)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Session refresh has already been attempted", buf, 0xCu);
      }
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = 8;
LABEL_20:
      objc_msgSend(v9, "hapErrorWithCode:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerControllerOperation finishWithError:](self, "finishWithError:", v12);

      return;
    }
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v13 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%@ Session has expired, refreshing", buf, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation _refreshSession]((uint64_t)self);
}

- (void)_sendRequest
{
  HAP2EncodedRequest *request;
  void *v4;
  HAP2EncodedRequest *v5;
  HAP2EncodedRequest *v6;
  HAP2EncodedRequest *v7;
  HAP2EncodedRequest *v8;
  HAP2EncodedRequest *v9;
  HAP2EncodedRequest *v10;
  HAP2AccessoryServerTransportRequest *v11;
  HAP2AccessoryServerTransportRequestEndpoint *v12;
  HAP2EncodedRequest *v13;
  HAP2EncodedRequest *v14;
  uint64_t v15;
  NSString *mimeType;
  uint64_t v17;
  void *v18;
  double timeout;
  HAP2AccessoryServerTransportCommon *transport;
  HAP2EncodedRequest *v21;
  uint64_t v22;
  HAP2AccessoryServerTransportRequest *v23;
  HAP2EncodedRequest *v24;
  uint64_t v25;
  NSString *v26;
  _QWORD v27[5];

  if (-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
    return;
  if (self)
    request = self->_request;
  else
    request = 0;
  -[HAP2EncodedRequest serialize](request, "serialize");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v5 = self->_request;
  else
    v5 = 0;
  v6 = v5;
  if (!-[HAP2EncodedRequest type](v6, "type"))
    goto LABEL_15;
  if (self)
    v7 = self->_request;
  else
    v7 = 0;
  v8 = v7;
  if (-[HAP2EncodedRequest type](v8, "type") == 2)
  {
LABEL_14:

LABEL_15:
LABEL_16:
    v11 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v12 = self->_endpoint;
      v13 = self->_request;
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
    v14 = v13;
    v15 = -[HAP2EncodedRequest isEncrypted](v14, "isEncrypted");
    if (self)
      mimeType = self->_mimeType;
    else
      mimeType = 0;
    v17 = -[HAP2AccessoryServerTransportRequest initForReadingWithEndpoint:data:encrypted:mimeType:](v11, "initForReadingWithEndpoint:data:encrypted:mimeType:", v12, v4, v15, mimeType);
    goto LABEL_21;
  }
  if (self)
    v9 = self->_request;
  else
    v9 = 0;
  v10 = v9;
  if (-[HAP2EncodedRequest type](v10, "type") == 5)
  {

    goto LABEL_14;
  }
  if (self)
    v21 = self->_request;
  else
    v21 = 0;
  v22 = -[HAP2EncodedRequest type](v21, "type");

  if (v22 == 9)
    goto LABEL_16;
  v23 = [HAP2AccessoryServerTransportRequest alloc];
  if (self)
  {
    v12 = self->_endpoint;
    v24 = self->_request;
  }
  else
  {
    v12 = 0;
    v24 = 0;
  }
  v14 = v24;
  v25 = -[HAP2EncodedRequest isEncrypted](v14, "isEncrypted");
  if (self)
    v26 = self->_mimeType;
  else
    v26 = 0;
  v17 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:](v23, "initForWritingWithEndpoint:data:encrypted:mimeType:", v12, v4, v25, v26);
LABEL_21:
  v18 = (void *)v17;

  if (self)
  {
    timeout = self->_timeout;
    if (timeout > 0.0)
      -[HAP2AccessoryServerControllerOperation _startTimerWithInterval:]((uint64_t)self, timeout);
    transport = self->_transport;
  }
  else
  {
    transport = 0;
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke;
  v27[3] = &unk_1E894A4A8;
  v27[4] = self;
  -[HAP2AccessoryServerTransportCommon sendRequest:completion:](transport, "sendRequest:completion:", v18, v27);

}

- (void)_parseResponseData:(id)a3
{
  id v4;
  HAP2AccessoryServerEncoding *v5;
  HAP2EncodedRequest *request;
  HAP2EncodedRequest *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  if (!-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
  {
    if (self)
    {
      v5 = self->_encoding;
      request = self->_request;
    }
    else
    {
      v5 = 0;
      request = 0;
    }
    v10 = 0;
    v7 = request;
    -[HAP2AccessoryServerEncoding responseForRequest:bodyData:error:](v5, "responseForRequest:bodyData:error:", v7, v4, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    if (v8)
    {
      -[HAP2AccessoryServerControllerOperation setResponse:]((uint64_t)self, v8);
      -[HAP2AccessoryServerControllerOperation finish](self, "finish");
    }
    else
    {
      -[HAP2AccessoryServerControllerOperation finishWithError:](self, "finishWithError:", v9);
    }

  }
}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;
  int v5;
  HAP2AccessoryServerControllerOperation *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_error_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%@ Timeout happened, attempting to cancel", (uint8_t *)&v5, 0xCu);
  }
  -[HAP2AccessoryServerControllerOperation cancel](self, "cancel");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  -[HAP2AccessoryServerControllerOperation controller]((id *)&self->super.super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR(" [%@/%@]"), v6, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_1E894EFE8;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)HAP2AccessoryServerControllerOperation;
  -[HAP2AccessoryServerControllerOperation description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (id)controller
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 37);
  return WeakRetained;
}

- (void)setResponse:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 360), a2);
}

- (void)_startTimerWithInterval:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 0, a2);
    objc_msgSend(v3, "setDelegate:", a1);
    v4 = *(void **)(a1 + 288);
    *(_QWORD *)(a1 + 288) = v3;
    v5 = v3;

    objc_msgSend(v5, "resume");
  }
}

void __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;

  v5 = a2;
  v6 = a3;
  -[HAP2AccessoryServerControllerOperation _cancelTimer](*(_QWORD *)(a1 + 32));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke_2;
  v15[3] = &unk_1E894E120;
  v7 = *(_QWORD *)(a1 + 32);
  v16 = v6;
  v17 = v7;
  v18 = v5;
  v8 = v5;
  v9 = v6;
  v10 = (void *)MEMORY[0x1D17B7400](v15);
  -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = *(void **)(v11 + 80);
  else
    v13 = 0;
  v14 = v13;
  objc_msgSend(v14, "addConcurrentBlock:", v10);

}

- (void)_cancelTimer
{
  void *v1;
  id v2;

  if (a1)
  {
    v1 = *(void **)(a1 + 288);
    if (v1)
    {
      *(_QWORD *)(a1 + 288) = 0;
      v2 = v1;

      objc_msgSend(v2, "suspend");
    }
  }
}

void __54__HAP2AccessoryServerControllerOperation__sendRequest__block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(id **)(a1 + 40);
  if (v3)
  {
    -[HAP2AccessoryServerControllerOperation controller](v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v5 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Forcing session expired", (uint8_t *)&v11, 0xCu);
      }
      -[HAP2AccessoryServerController setSessionStartTime:]((uint64_t)v4, 1);
    }

    if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32)) & 1) == 0)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v6 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD **)(a1 + 40);
        if (v7)
          v8 = v7[44];
        else
          v8 = 0;
        v9 = *(_QWORD *)(a1 + 32);
        v11 = 138412802;
        v12 = v7;
        v13 = 2112;
        v14 = v8;
        v15 = 2112;
        v16 = v9;
        v10 = v6;
        _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Failed to send request %@: %@", (uint8_t *)&v11, 0x20u);

      }
      -[HAP2AccessoryServerControllerOperation _handleSendRequestError:](*(_BYTE **)(a1 + 40), *(void **)(a1 + 32));
    }
  }
  else
  {
    objc_msgSend(v2, "_parseResponseData:", *(_QWORD *)(a1 + 48));
  }
}

- (uint64_t)_maybeRefreshSessionAfterError:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
    goto LABEL_14;
  if ((*(_BYTE *)(a1 + 344) & 2) != 0)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v19 = 138412290;
    v20 = a1;
    v7 = "%@ Session refresh not allowed for this operation";
    v8 = v6;
    goto LABEL_12;
  }
  if (*(_BYTE *)(a1 + 280))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = a1;
      _os_log_debug_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEBUG, "%@ Session refresh already attempted once, not attempting again", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_13;
  }
  v10 = v3;
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_msgSend(v10, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("HAPErrorDomain"));

  v17 = v16 && (objc_msgSend(v10, "code") == 17 || objc_msgSend(v10, "code") == 8 && objc_msgSend(v14, "code") == 1);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v18 = hap2Log_accessory;
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      goto LABEL_13;
    v19 = 138412290;
    v20 = a1;
    v7 = "%@ Session refresh wouldn't help with this error, not attempting";
    v8 = v18;
LABEL_12:
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v19, 0xCu);
LABEL_13:
    a1 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = a1;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEFAULT, "%@ Refreshing session due to error: %@", (uint8_t *)&v19, 0x16u);
  }
  -[HAP2AccessoryServerControllerOperation _refreshSession](a1);
  a1 = 1;
LABEL_14:

  return a1;
}

- (void)_handleSendRequestError:(_BYTE *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  _BYTE *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((a1[344] & 1) != 0
      && objc_msgSend(v3, "code") == 17
      && (objc_msgSend(v4, "domain"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HAPErrorDomain")),
          v5,
          v6))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v7 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v11 = a1;
        _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_INFO, "%@ Allowing expired session to stay open", buf, 0xCu);
      }
      objc_msgSend(a1, "finishWithError:", v4);
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __66__HAP2AccessoryServerControllerOperation__handleSendRequestError___block_invoke;
      v8[3] = &unk_1E894E0F8;
      v8[4] = a1;
      v9 = v4;
      -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:]((uint64_t)a1, v8);

    }
  }

}

uint64_t __66__HAP2AccessoryServerControllerOperation__handleSendRequestError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_closeSessionWithCompletion:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 296));
    v5 = WeakRetained;
    if (WeakRetained)
      v6 = (void *)*((_QWORD *)WeakRetained + 10);
    else
      v6 = 0;
    v7 = v6;
    objc_msgSend(v7, "assertCurrentQueue");

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a1;
      _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ Closing session", buf, 0xCu);
    }
    v9 = *(void **)(a1 + 312);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke;
    v10[3] = &unk_1E894CC98;
    v10[4] = a1;
    v11 = v3;
    objc_msgSend(v9, "closeWithError:completion:", 0, v10);

  }
}

void __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  id v13;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke_2;
  v11 = &unk_1E894D5E0;
  v2 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v2;
  v3 = (void *)MEMORY[0x1D17B7400](&v8);
  -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = *(void **)(v4 + 80);
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "addConcurrentBlock:", v3, v8, v9, v10, v11, v12);

}

uint64_t __70__HAP2AccessoryServerControllerOperation__closeSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v2 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CCE01000, v2, OS_LOG_TYPE_INFO, "%@ Session closed", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_refreshSession
{
  _QWORD v1[5];

  if (a1)
  {
    *(_BYTE *)(a1 + 280) = 1;
    v1[0] = MEMORY[0x1E0C809B0];
    v1[1] = 3221225472;
    v1[2] = __57__HAP2AccessoryServerControllerOperation__refreshSession__block_invoke;
    v1[3] = &unk_1E894DD08;
    v1[4] = a1;
    -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](a1, v1);
  }
}

uint64_t __57__HAP2AccessoryServerControllerOperation__refreshSession__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openTransport:", 0);
}

void __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _BYTE v26[24];
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HAP2AccessoryServerControllerOperation controller](*(id **)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = *(void **)(v6 + 80);
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v9, "assertCurrentQueue");

  v10 = *(void **)(a1 + 32);
  if (!v5)
  {
    objc_msgSend(v10, "_sendRequest");
    goto LABEL_28;
  }
  if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:]((uint64_t)v10, v5) & 1) == 0)
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v5;
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (a2)
      {
        objc_msgSend(v13, "domain");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v18, "isEqualToString:", CFSTR("HAPErrorDomain")))
          goto LABEL_21;
        if (objc_msgSend(v13, "code") == 19)
        {

LABEL_16:
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v20 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v11;
            _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEFAULT, "%@ Failed to connect - will try the next IP address for the accessory", buf, 0xCu);
          }
          *(_QWORD *)v26 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v26[8] = 3221225472;
          *(_QWORD *)&v26[16] = __71__HAP2AccessoryServerControllerOperation__retryNextIPAddress_rtnError___block_invoke;
          v27 = &unk_1E894DD08;
          v28 = v11;
          -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](v11, v26);

          goto LABEL_28;
        }
        if (objc_msgSend(v13, "code") == 8)
        {
          v19 = objc_msgSend(v17, "code");

          if (v19 == 24)
            goto LABEL_16;
        }
        else
        {
LABEL_21:

        }
      }

    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v21 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v26 = 138412546;
      *(_QWORD *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2112;
      *(_QWORD *)&v26[14] = v13;
      _os_log_error_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%@ Open failed: %@", v26, 0x16u);
    }
    v22 = *(_QWORD *)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke_9;
    v24[3] = &unk_1E894E0F8;
    v24[4] = v22;
    v25 = v13;
    -[HAP2AccessoryServerControllerOperation _closeSessionWithCompletion:](v22, v24);

  }
LABEL_28:

}

uint64_t __57__HAP2AccessoryServerControllerOperation__openTransport___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", *(_QWORD *)(a1 + 40));
}

uint64_t __71__HAP2AccessoryServerControllerOperation__retryNextIPAddress_rtnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openTransport:", 1);
}

- (void)setRequest:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 352), a2);
}

@end
