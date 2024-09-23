@implementation HAP2AccessoryServerTransportBaseOperationOpen

- (HAP2AccessoryServerTransportBaseOperationOpen)initWithTransport:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  HAP2AccessoryServerTransportBaseOperationOpen *v12;
  uint64_t v13;
  id clientCompletion;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.open"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)HAP2AccessoryServerTransportBaseOperationOpen;
  v12 = -[HAP2AccessoryServerTransportBaseOperation initWithName:transport:](&v23, sel_initWithName_transport_, v11, v6);

  if (v12)
  {
    v13 = MEMORY[0x1D17B7400](v7);
    clientCompletion = v12->_clientCompletion;
    v12->_clientCompletion = (id)v13;

    objc_msgSend(v6, "delegateQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v12);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke;
    v18[3] = &unk_1E894DC48;
    objc_copyWeak(&v21, &location);
    v16 = v15;
    v19 = v16;
    v20 = v7;
    -[HAP2AccessoryServerTransportBaseOperationOpen setCompletionBlock:](v12, "setCompletionBlock:", v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)main
{
  HAP2AccessoryServerTransportBase *v3;
  HAP2AccessoryServerTransportBaseOperationOpen *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v23;
  HAP2AccessoryServerTransportBase *val;
  id location;
  id v26;
  _QWORD v27[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  __int128 buf;
  void (*v39)(uint64_t, char, void *, void *);
  void *v40;
  HAP2AccessoryServerTransportBaseOperationOpen *v41;
  HAP2AccessoryServerTransportBase *v42;
  id v43;
  id v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  if (self && (v3 = self->super._transport) != 0)
  {
    val = v3;
    v4 = self;
    -[HAP2AccessoryServerTransportBase operationQueue](val, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertCurrentQueue");

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__6303;
    v36 = __Block_byref_object_dispose__6304;
    v37 = 0;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    -[HAP2AccessoryServerTransportBase propertyLock](val, "propertyLock");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke;
    v27[3] = &unk_1E894B360;
    v27[4] = val;
    v27[5] = &v32;
    v27[6] = &v28;
    objc_msgSend(v6, "performWritingBlock:", v27);

    if (v33[5])
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v8 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = val;
        _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ (Base) Not opening while a close is enqueued", (uint8_t *)&buf, 0xCu);
      }
      -[HAP2AsynchronousOperation cancelWithError:](v4, "cancelWithError:", v33[5]);
    }
    else if (v29[3] == 2)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = val;
        _os_log_debug_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%@ (Base) Already open", (uint8_t *)&buf, 0xCu);
      }
      -[HAP2AsynchronousOperation finish](v4, "finish");
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = val;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_DEFAULT, "%@ (Base) Opening", (uint8_t *)&buf, 0xCu);
      }
      -[HAP2AccessoryServerTransportBase didChangeStateWithError:](val, "didChangeStateWithError:", 0);
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ Open Transport"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28660]), "initWithName:timeout:", CFSTR("Open Transport"), 60.0);
      v26 = 0;
      if (v15)
      {
        v16 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v16, "initWithIdentifier:name:parent:assertions:", v17, v14, 0, v18);
        v20 = v26;
        v26 = v19;

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v21 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = val;
          _os_log_error_impl(&dword_1CCE01000, v21, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", (uint8_t *)&buf, 0xCu);
        }
        v22 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "initWithIdentifier:name:parent:options:", v17, v14, 0, 0);
        v18 = v26;
        v26 = v23;
      }

      objc_initWeak(&location, val);
      *(_QWORD *)&buf = v7;
      *((_QWORD *)&buf + 1) = 3221225472;
      v39 = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_20;
      v40 = &unk_1E894A920;
      v41 = v4;
      v42 = val;
      v43 = v26;
      objc_copyWeak(&v44, &location);
      -[HAP2AccessoryServerTransportBase doOpenWithCompletion:](val, "doOpenWithCompletion:", &buf);
      objc_destroyWeak(&v44);

      objc_destroyWeak(&location);
      __HMFActivityScopeLeave();

    }
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    -[HAP2AsynchronousOperation cancel](self, "cancel");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletion, 0);
}

void __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke(uint64_t a1)
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
    v4 = WeakRetained[36];
    objc_setProperty_nonatomic_copy(v3, v5, 0, 288);
    if (v4)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke_2;
      v7[3] = &unk_1E894D5E0;
      v6 = *(NSObject **)(a1 + 32);
      v9 = *(id *)(a1 + 40);
      v8 = v3;
      dispatch_async(v6, v7);

    }
  }

}

void __78__HAP2AccessoryServerTransportBaseOperationOpen_initWithTransport_completion___block_invoke_2(uint64_t a1)
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
