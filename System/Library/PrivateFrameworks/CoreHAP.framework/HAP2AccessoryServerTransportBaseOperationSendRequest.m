@implementation HAP2AccessoryServerTransportBaseOperationSendRequest

- (HAP2AccessoryServerTransportBaseOperationSendRequest)initWithTransport:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  HAP2AccessoryServerTransportBaseOperationSendRequest *v15;
  uint64_t v16;
  id clientCompletion;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id location;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.sendRequest"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerTransportBaseOperationSendRequest;
  v15 = -[HAP2AccessoryServerTransportBaseOperation initWithName:transport:](&v26, sel_initWithName_transport_, v14, v8);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_request, a4);
    v16 = MEMORY[0x1D17B7400](v10);
    clientCompletion = v15->_clientCompletion;
    v15->_clientCompletion = (id)v16;

    objc_msgSend(v8, "delegateQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v15);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke;
    v21[3] = &unk_1E894DC48;
    objc_copyWeak(&v24, &location);
    v19 = v18;
    v22 = v19;
    v23 = v10;
    -[HAP2AccessoryServerTransportBaseOperationSendRequest setCompletionBlock:](v15, "setCompletionBlock:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v15;
}

- (void)main
{
  HAP2AccessoryServerTransportBase *v3;
  HAP2AccessoryServerTransportBaseOperationSendRequest *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  HAP2AccessoryServerTransportRequest *request;
  NSObject *v11;
  HAP2AccessoryServerTransportRequest *v12;
  HAP2AccessoryServerTransportBaseOperationSendRequest *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  HAP2AccessoryServerTransportRequest *v17;
  NSObject *v18;
  HAP2AccessoryServerTransportBase *v19;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint8_t v31[4];
  HAP2AccessoryServerTransportBase *v32;
  __int16 v33;
  HAP2AccessoryServerTransportRequest *v34;
  _BYTE buf[24];
  void *v36;
  HAP2AccessoryServerTransportBaseOperationSendRequest *v37;
  HAP2AccessoryServerTransportBase *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (self && (v3 = self->super._transport) != 0)
  {
    v19 = v3;
    v4 = self;
    -[HAP2AccessoryServerTransportBase operationQueue](v19, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertCurrentQueue");

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__6303;
    v29 = __Block_byref_object_dispose__6304;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[HAP2AccessoryServerTransportBase propertyLock](v19, "propertyLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke;
    v20[3] = &unk_1E894B360;
    v20[4] = v19;
    v20[5] = &v25;
    v20[6] = &v21;
    objc_msgSend(v6, "performReadingBlock:", v20);

    if (v26[5])
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ (Base) Not sending while a close is enqueued", buf, 0xCu);
      }
      -[HAP2AsynchronousOperation cancelWithError:](v4, "cancelWithError:", v26[5], v19);
    }
    else
    {
      if (*((_BYTE *)v22 + 24))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v9 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          request = v4->_request;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = request;
          v11 = v9;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "%@ (Base) Sending request %@", buf, 0x16u);

        }
        v12 = v4->_request;
        *(_QWORD *)buf = v7;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke_24;
        v36 = &unk_1E894A948;
        v13 = v4;
        v37 = v13;
        v38 = v19;
        -[HAP2AccessoryServerTransportBase doSendRequest:completion:](v19, "doSendRequest:completion:", v12, buf);

        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v14 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          v17 = v13->_request;
          *(_DWORD *)v31 = 138412546;
          v32 = v19;
          v33 = 2112;
          v34 = v17;
          v18 = v14;
          _os_log_debug_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_DEBUG, "%@ (Base) Sent request %@", v31, 0x16u);

        }
        v15 = v37;
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v16 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v19;
          _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%@ (Base) Cannot send when not open", buf, 0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 19, v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2AsynchronousOperation cancelWithError:](v4, "cancelWithError:", v15);
      }

    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    -[HAP2AsynchronousOperation cancel](self, "cancel");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  SEL v5;
  NSObject *v6;
  _QWORD v7[4];
  id *v8;
  id v9;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[38];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 304);
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 32);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke_2;
      v7[3] = &unk_1E894D5E0;
      v8 = v3;
      v9 = *(id *)(a1 + 40);
      dispatch_async(v6, v7);

    }
  }

}

void __93__HAP2AccessoryServerTransportBaseOperationSendRequest_initWithTransport_request_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

  }
  else
  {
    if (v3)
      v6 = v3[37];
    else
      v6 = 0;
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v4 + 16))(*(_QWORD *)(a1 + 40), v6, 0);
  }
  -[HAP2AccessoryServerTransportBaseOperation setTransport:](*(_QWORD *)(a1 + 32));
}

@end
