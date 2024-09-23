@implementation HAP2AccessoryServerTransportBaseOperationClose

- (HAP2AccessoryServerTransportBaseOperationClose)initWithTransport:(id)a3 desiredError:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  HAP2AccessoryServerTransportBaseOperationClose *v15;
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
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.close"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerTransportBaseOperationClose;
  v15 = -[HAP2AccessoryServerTransportBaseOperation initWithName:transport:](&v26, sel_initWithName_transport_, v14, v8);

  if (v15)
  {
    objc_storeStrong((id *)&v15->_desiredError, a4);
    v16 = MEMORY[0x1D17B7400](v10);
    clientCompletion = v15->_clientCompletion;
    v15->_clientCompletion = (id)v16;

    objc_msgSend(v8, "delegateQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v15);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke;
    v21[3] = &unk_1E894DC48;
    objc_copyWeak(&v24, &location);
    v19 = v18;
    v22 = v19;
    v23 = v10;
    -[HAP2AccessoryServerTransportBaseOperationClose setCompletionBlock:](v15, "setCompletionBlock:", v21);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v15;
}

- (void)main
{
  HAP2AccessoryServerTransportBase *v3;
  HAP2AccessoryServerTransportBaseOperationClose *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  HAP2AccessoryServerTransportBase *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *(*v16)(uint64_t);
  void *v17;
  id *v18;
  HAP2AccessoryServerTransportBase *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  void (*v26)(uint64_t, char, void *, void *);
  void *v27;
  id v28;
  id *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self && (v3 = self->super._transport) != 0)
  {
    v12 = v3;
    v4 = self;
    -[HAP2AccessoryServerTransportBase operationQueue](v12, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertCurrentQueue");

    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    -[HAP2AccessoryServerTransportBase propertyLock](v12, "propertyLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke;
    v17 = &unk_1E894BD68;
    v8 = v4;
    v18 = v8;
    v19 = v12;
    v20 = &v21;
    objc_msgSend(v6, "performWritingBlock:", &v14);

    if (v22[3])
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%@ (Base) Closing", (uint8_t *)&buf, 0xCu);
      }
      -[HAP2AccessoryServerTransportBase didChangeStateWithError:](v12, "didChangeStateWithError:", 0, v12, v14, v15, v16, v17);
      v10 = v8[36];
      *(_QWORD *)&buf = v7;
      *((_QWORD *)&buf + 1) = 3221225472;
      v26 = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_26;
      v27 = &unk_1E894A970;
      v28 = v13;
      v29 = v8;
      objc_msgSend(v13, "doCloseWithError:completion:", v10, &buf);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v12;
        _os_log_debug_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEBUG, "%@ (Base) Already closed", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v8, "finish", v12, v14, v15, v16, v17);
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    -[HAP2AsynchronousOperation cancel](self, "cancel");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletion, 0);
  objc_storeStrong((id *)&self->_desiredError, 0);
}

void __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke(uint64_t a1)
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
    v4 = WeakRetained[37];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 296);
    if (v4)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke_2;
      v7[3] = &unk_1E894D5E0;
      v6 = *(NSObject **)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v8 = v3;
      dispatch_async(v6, v7);

    }
  }

}

void __92__HAP2AccessoryServerTransportBaseOperationClose_initWithTransport_desiredError_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v2 + 16))(v2, 0, 0, v3);

  -[HAP2AccessoryServerTransportBaseOperation setTransport:](*(_QWORD *)(a1 + 32));
}

@end
