@implementation HAP2AccessoryServerControllerTimedWriteOperation

- (HAP2AccessoryServerControllerTimedWriteOperation)initWithName:(id)a3 controller:(id)a4 encoding:(id)a5 transport:(id)a6 prepareRequest:(id)a7 executeRequest:(id)a8 endpoint:(id)a9 mimeType:(id)a10 timeout:(double)a11 options:(unint64_t)a12
{
  HAP2AccessoryServerControllerTimedWriteOperation *v20;
  HAP2AccessoryServerControllerTimedWriteOperation *v21;
  id v23;
  objc_super v24;

  v23 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HAP2AccessoryServerControllerTimedWriteOperation;
  v20 = -[HAP2AccessoryServerControllerOperation initWithName:controller:encoding:transport:request:endpoint:mimeType:timeout:options:](&v24, sel_initWithName_controller_encoding_transport_request_endpoint_mimeType_timeout_options_, a3, a4, a5, a6, a7, a9, a11, a10, a12);
  v21 = v20;
  if (v20)
    objc_storeStrong((id *)&v20->_executeRequest, a8);

  return v21;
}

- (void)_parseResponseData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)_cleanUp
{
  objc_super v3;

  -[HAP2AccessoryServerControllerOperation _cancelTimer]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServerControllerTimedWriteOperation;
  -[HAP2AccessoryServerControllerOperation _cleanUp](&v3, sel__cleanUp);
}

- (void)_sendPrepareRequest
{
  HAP2EncodedRequest *request;
  HAP2EncodedRequest *v4;
  void *v5;
  HAP2AccessoryServerTransportRequest *v6;
  HAP2AccessoryServerTransportRequestEndpoint *v7;
  NSString *mimeType;
  NSString *v9;
  id v10;
  NSObject *v11;
  HAP2AccessoryServerTransportCommon *transport;
  HAP2AccessoryServerTransportCommon *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  HAP2AccessoryServerControllerTimedWriteOperation *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
  {
    if (self)
      request = self->super._request;
    else
      request = 0;
    v4 = request;
    -[HAP2EncodedRequest serialize](v4, "serialize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v7 = self->super._endpoint;
      mimeType = self->super._mimeType;
    }
    else
    {
      v7 = 0;
      mimeType = 0;
    }
    v9 = mimeType;
    v10 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:](v6, "initForWritingWithEndpoint:data:encrypted:mimeType:", v7, v5, 1, v9);

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v16 = self;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%@ Sending prepare timed write", buf, 0xCu);
    }
    if (self)
      transport = self->super._transport;
    else
      transport = 0;
    v13 = transport;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__HAP2AccessoryServerControllerTimedWriteOperation__sendPrepareRequest__block_invoke;
    v14[3] = &unk_1E894A4A8;
    v14[4] = self;
    -[HAP2AccessoryServerTransportCommon sendRequest:completion:](v13, "sendRequest:completion:", v10, v14);

  }
}

- (void)_parsePrepareResponseData:(id)a3
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
      v5 = self->super._encoding;
      request = self->super._request;
    }
    else
    {
      v5 = 0;
      request = 0;
    }
    v7 = request;
    v10 = 0;
    -[HAP2AccessoryServerEncoding responseForRequest:bodyData:error:](v5, "responseForRequest:bodyData:error:", v7, v4, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    if (v8)
      -[HAP2AccessoryServerControllerTimedWriteOperation _sendExecuteRequest](self, "_sendExecuteRequest");
    else
      -[HAP2AccessoryServerControllerOperation finishWithError:](self, "finishWithError:", v9);

  }
}

- (void)_sendExecuteRequest
{
  void *v3;
  HAP2EncodedRequest *request;
  HAP2EncodedRequest *v5;
  void *v6;
  HAP2AccessoryServerTransportRequest *v7;
  HAP2AccessoryServerTransportRequestEndpoint *v8;
  NSString *mimeType;
  NSString *v10;
  id v11;
  double timeout;
  NSObject *v13;
  HAP2AccessoryServerTransportCommon *transport;
  HAP2AccessoryServerTransportCommon *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  HAP2AccessoryServerControllerTimedWriteOperation *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!-[HAP2AsynchronousOperation isCancelled](self, "isCancelled"))
  {
    -[HAP2AccessoryServerControllerTimedWriteOperation executeRequest](self, "executeRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerControllerOperation setRequest:]((uint64_t)self, v3);

    if (self)
      request = self->super._request;
    else
      request = 0;
    v5 = request;
    -[HAP2EncodedRequest serialize](v5, "serialize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [HAP2AccessoryServerTransportRequest alloc];
    if (self)
    {
      v8 = self->super._endpoint;
      mimeType = self->super._mimeType;
    }
    else
    {
      v8 = 0;
      mimeType = 0;
    }
    v10 = mimeType;
    v11 = -[HAP2AccessoryServerTransportRequest initForWritingWithEndpoint:data:encrypted:mimeType:](v7, "initForWritingWithEndpoint:data:encrypted:mimeType:", v8, v6, 1, v10);

    if (self)
    {
      timeout = self->super._timeout;
      if (timeout > 0.0)
        -[HAP2AccessoryServerControllerOperation _startTimerWithInterval:]((uint64_t)self, timeout);
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v13 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = self;
      _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%@ Executing timed write", buf, 0xCu);
    }
    if (self)
      transport = self->super._transport;
    else
      transport = 0;
    v15 = transport;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__HAP2AccessoryServerControllerTimedWriteOperation__sendExecuteRequest__block_invoke;
    v16[3] = &unk_1E894A4A8;
    v16[4] = self;
    -[HAP2AccessoryServerTransportCommon sendRequest:completion:](v15, "sendRequest:completion:", v11, v16);

  }
}

- (void)_parseExecuteResponseData:(id)a3
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
      v5 = self->super._encoding;
      request = self->super._request;
    }
    else
    {
      v5 = 0;
      request = 0;
    }
    v7 = request;
    v10 = 0;
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

- (HAP2EncodedRequest)executeRequest
{
  return self->_executeRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executeRequest, 0);
}

void __71__HAP2AccessoryServerControllerTimedWriteOperation__sendExecuteRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  -[HAP2AccessoryServerControllerOperation _cancelTimer](*(_QWORD *)(a1 + 32));
  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Executing timed write failed with error: %@", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_parseExecuteResponseData:", v5);
  }

}

void __71__HAP2AccessoryServerControllerTimedWriteOperation__sendPrepareRequest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    if ((-[HAP2AccessoryServerControllerOperation _maybeRefreshSessionAfterError:]((uint64_t)v7, v6) & 1) == 0)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = 138412546;
        v11 = v9;
        v12 = 2112;
        v13 = v6;
        _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Prepare timed write failed with error: %@", (uint8_t *)&v10, 0x16u);
      }
      -[HAP2AccessoryServerControllerOperation _handleSendRequestError:](*(_BYTE **)(a1 + 32), v6);
    }
  }
  else
  {
    objc_msgSend(v7, "_parsePrepareResponseData:", v5);
  }

}

@end
