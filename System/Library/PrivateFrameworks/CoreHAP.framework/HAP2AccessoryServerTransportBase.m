@implementation HAP2AccessoryServerTransportBase

- (HAP2AccessoryServerTransportBase)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerTransportBase)initWithOperationQueue:(id)a3 delegateQueue:(id)a4
{
  id v7;
  id v8;
  HAP2AccessoryServerTransportBase *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HAP2PropertyLock *propertyLock;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HAP2AccessoryServerTransportBase;
  v9 = -[HAP2AccessoryServerTransportBase init](&v17, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.propertyLock"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    propertyLock = v9->_propertyLock;
    v9->_propertyLock = (HAP2PropertyLock *)v14;

    objc_storeStrong((id *)&v9->_operationQueue, a3);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    v9->_internalState = 0;

  }
  return v9;
}

- (unint64_t)state
{
  void *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__HAP2AccessoryServerTransportBase_state__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (double)maxRequestTimeout
{
  void *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HAP2AccessoryServerTransportBase_maxRequestTimeout__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setMaxRequestTimeout:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  -[HAP2AccessoryServerTransportBase propertyLock](self, "propertyLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HAP2AccessoryServerTransportBase_setMaxRequestTimeout___block_invoke;
  v7[3] = &unk_1E894D3B0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  objc_msgSend(v6, "performWritingBlock:", v7);

}

- (HAP2AccessoryServerTransportCommon)underlyingTransport
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)openWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  HAP2AccessoryServerTransportBaseOperationOpen *v6;
  void *v7;
  int v8;
  HAP2AccessoryServerTransportBase *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling open", (uint8_t *)&v8, 0xCu);
  }
  v6 = -[HAP2AccessoryServerTransportBaseOperationOpen initWithTransport:completion:]([HAP2AccessoryServerTransportBaseOperationOpen alloc], "initWithTransport:completion:", self, v4);

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addOperation:", v6);

}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HAP2AccessoryServerTransportBaseOperationSendRequest *v9;
  void *v10;
  int v11;
  HAP2AccessoryServerTransportBase *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling send for request %@", (uint8_t *)&v11, 0x16u);
  }
  v9 = -[HAP2AccessoryServerTransportBaseOperationSendRequest initWithTransport:request:completion:]([HAP2AccessoryServerTransportBaseOperationSendRequest alloc], "initWithTransport:request:completion:", self, v6, v7);

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v9);

}

- (void)closeWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  HAP2AccessoryServerTransportBase *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = self;
    _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling close", (uint8_t *)&v9, 0xCu);
  }
  -[HAP2AccessoryServerTransportBase _closeWithError:completion:](self, v7, v6);

}

- (unint64_t)protocolFeaturesForVersion:(id)a3
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

- (id)wellKnownEndpoint:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)endpointForCharacteristic:(id)a3
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

- (id)endpointForCharacteristics:(id)a3
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

- (id)mimeTypeForCharacteristicRequests
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (id)mimeTypeForWellKnownEndpoint:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (BOOL)mergeWithNewTransport:(id)a3
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

- (void)updateMaxRequestTimeout:(double)a3
{
  NSObject *v6;
  void *v7;
  HAP2AsynchronousBlockOperation *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  _BYTE buf[24];
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@ (Base) Scheduling max request timeout change: %f", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__6303;
  v16 = __Block_byref_object_dispose__6304;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__HAP2AccessoryServerTransportBase_updateMaxRequestTimeout___block_invoke;
  v13[3] = &unk_1E894C548;
  *(double *)&v13[6] = a3;
  v13[4] = self;
  v13[5] = buf;
  v7 = (void *)MEMORY[0x1D17B7400](v13);
  v8 = [HAP2AsynchronousBlockOperation alloc];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HAP2AsynchronousBlockOperation initWithName:block:](v8, "initWithName:block:", v9, v7);
  v11 = *(void **)(*(_QWORD *)&buf[8] + 40);
  *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v10;

  -[HAP2AccessoryServerTransportBase operationQueue](self, "operationQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addOperation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
}

- (void)didChangeStateWithError:(id)a3
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

- (void)doOpenWithCompletion:(id)a3
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

- (void)doSendRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)doCloseWithError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ is unavailable"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (void)didDisconnectWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  HAP2AccessoryServerTransportBase *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ (Base) Disconnected with error: %@", (uint8_t *)&v6, 0x16u);
  }
  -[HAP2AccessoryServerTransportBase _closeWithError:completion:](self, v4, &__block_literal_global_6279);

}

- (void)doUpdateMaxRequestTimeout:(double)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is unavailable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_queuedCloseOperation, 0);
}

- (void)_closeWithError:(void *)a3 completion:
{
  id v5;
  id v6;
  HAP2AccessoryServerTransportBaseOperationClose *v7;
  void *v8;
  void *v9;
  HAP2AccessoryServerTransportBaseOperationClose *v10;
  _QWORD v11[5];
  HAP2AccessoryServerTransportBaseOperationClose *v12;

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    v7 = -[HAP2AccessoryServerTransportBaseOperationClose initWithTransport:desiredError:completion:]([HAP2AccessoryServerTransportBaseOperationClose alloc], "initWithTransport:desiredError:completion:", a1, v6, v5);

    objc_msgSend(a1, "propertyLock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __63__HAP2AccessoryServerTransportBase__closeWithError_completion___block_invoke;
    v11[3] = &unk_1E894E0F8;
    v11[4] = a1;
    v12 = v7;
    v10 = v7;
    objc_msgSend(v8, "performWritingBlock:", v11);

    objc_msgSend(a1, "operationQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v10);

  }
}

void __63__HAP2AccessoryServerTransportBase__closeWithError_completion___block_invoke(uint64_t a1)
{
  -[HAP2AccessoryServerTransportBase setQueuedCloseOperation:](*(id **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)setQueuedCloseOperation:(id *)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "propertyLock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertOwner");

    objc_storeStrong(a1 + 2, a2);
  }

}

_QWORD *__56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *result;

  v2 = *(void **)(a1 + 32);
  -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
    -[HAP2AccessoryServerTransportBase setQueuedCloseOperation:](*(id **)(a1 + 40), 0);
  if ((unint64_t)-[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 40)) - 1 <= 1)
    -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 40), 3);
  result = -[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_26(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  const char *v15;
  _QWORD *v16;
  void *v17;
  NSObject *v18;
  _QWORD *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  char v27;
  _QWORD v28[5];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v9 = hap2Log_accessory;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v10;
      v31 = 2112;
      v32 = v8;
      _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to close: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v30 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%@ (Base) Closed", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "propertyLock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_27;
  v28[3] = &unk_1E894DD08;
  v28[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v12, "performWritingBlock:", v28);

  v14 = *(_QWORD **)(a1 + 40);
  if (v14)
    v14 = (_QWORD *)v14[37];
  v16 = v14;
  v17 = *(void **)(a1 + 40);
  if (v17)
    objc_setProperty_nonatomic_copy(v17, v15, 0, 296);
  objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_2;
  block[3] = &unk_1E894CF58;
  v19 = v16;
  v26 = v19;
  v27 = a2;
  v20 = v7;
  v24 = v20;
  v21 = v8;
  v25 = v21;
  dispatch_async(v18, block);

  objc_msgSend(*(id *)(a1 + 32), "didChangeStateWithError:", v21);
  v22 = *(void **)(a1 + 40);
  if (v8)
    objc_msgSend(v22, "finishWithError:", v21);
  else
    objc_msgSend(v22, "finish");

}

void __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_27(uint64_t a1)
{
  -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 32), 0);
}

uint64_t __56__HAP2AccessoryServerTransportBase__closeWithOperation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)setInternalState:(_QWORD *)a1
{
  void *v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    objc_msgSend(a1, "propertyLock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertOwner");

    a1[1] = a2;
  }
}

- (id)queuedCloseOperation
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "propertyLock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertOwner");

    a1 = (id *)v1[2];
  }
  return a1;
}

- (_QWORD)internalState
{
  _QWORD *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "propertyLock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertOwner");

    return (_QWORD *)v1[1];
  }
  return result;
}

uint64_t __60__HAP2AccessoryServerTransportBase_updateMaxRequestTimeout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "doUpdateMaxRequestTimeout:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setMaxRequestTimeout:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "finish");
}

void __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;

  -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v2;
  if (v2)
  {
    v3 = *(id *)(v2 + 288);
    v4 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    if (!v3)

    v5 = v7;
  }
  else
  {
    v6 = -[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 32));
    v5 = 0;
    switch((unint64_t)v6)
    {
      case 0uLL:
      case 1uLL:
      case 3uLL:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        break;
      case 2uLL:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        break;
      default:
        break;
    }
  }

}

void __62__HAP2AccessoryServerTransportBase__sendRequestWithOperation___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v17 = 138412290;
      *(_QWORD *)&v17[4] = v9;
      _os_log_debug_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_DEBUG, "%@ (Base) Operation was canceled", v17, 0xCu);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        if (v12)
          v12 = *(_QWORD *)(v12 + 288);
        *(_DWORD *)v17 = 138412546;
        *(_QWORD *)&v17[4] = v11;
        *(_WORD *)&v17[12] = 2112;
        *(_QWORD *)&v17[14] = v12;
        v13 = v10;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_INFO, "%@ (Base) Received response for request %@", v17, 0x16u);

      }
      v14 = *(_QWORD *)(a1 + 32);
      if (v14)
      {
        objc_storeStrong((id *)(v14 + 296), a2);
        v15 = *(void **)(a1 + 32);
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v15, "finish", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)v17 = 138412546;
        *(_QWORD *)&v17[4] = v16;
        *(_WORD *)&v17[12] = 2112;
        *(_QWORD *)&v17[14] = v7;
        _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to send: %@", v17, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v7);
    }
  }

}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD *v5;
  id v7;

  -[HAP2AccessoryServerTransportBase queuedCloseOperation](*(id **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)v2;
  if (v2)
  {
    v3 = *(id *)(v2 + 288);
    v4 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    if (!v3)

  }
  else
  {
    v5 = -[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 32));
    if ((unint64_t)v5 <= 3 && v5 != (_QWORD *)2)
      -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 32), 1);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 32));
  }

}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_20(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id WeakRetained;
  void *v11;
  _QWORD *v12;
  const char *v13;
  _QWORD *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  char v37;
  _QWORD v38[5];
  _QWORD v39[5];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v41 = v28;
      _os_log_debug_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%@ (Base) Operation was canceled", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "invalidate");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertCurrentQueue");

    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[36];
    v14 = v12;
    v15 = *(void **)(a1 + 32);
    if (v15)
      objc_setProperty_nonatomic_copy(v15, v13, 0, 288);
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v16 = hap2Log_accessory;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = WeakRetained;
        v42 = 2112;
        v43 = v8;
        _os_log_error_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_ERROR, "%@ (Base) Failed to open: %@", buf, 0x16u);
      }
      objc_msgSend(WeakRetained, "propertyLock");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_21;
      v39[3] = &unk_1E894DD08;
      v39[4] = WeakRetained;
      objc_msgSend(v17, "performWritingBlock:", v39);

      objc_msgSend(WeakRetained, "didChangeStateWithError:", v8);
      objc_msgSend(WeakRetained, "propertyLock");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v18;
      v38[1] = 3221225472;
      v38[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2;
      v38[3] = &unk_1E894DD08;
      v38[4] = WeakRetained;
      objc_msgSend(v19, "performWritingBlock:", v38);

      objc_msgSend(WeakRetained, "delegateQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = v18;
      block[1] = 3221225472;
      block[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_3;
      block[3] = &unk_1E894CF58;
      v36 = v14;
      v37 = a2;
      v34 = v7;
      v21 = v8;
      v35 = v21;
      v22 = v14;
      dispatch_async(v20, block);

      objc_msgSend(WeakRetained, "didChangeStateWithError:", v21);
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v21);
      objc_msgSend(*(id *)(a1 + 48), "invalidate");

      v23 = v36;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = WeakRetained;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "%@ (Base) Opened", buf, 0xCu);
      }
      objc_msgSend(WeakRetained, "propertyLock");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x1E0C809B0];
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_22;
      v32[3] = &unk_1E894DD08;
      v32[4] = WeakRetained;
      objc_msgSend(v24, "performWritingBlock:", v32);

      objc_msgSend(WeakRetained, "delegateQueue");
      v26 = objc_claimAutoreleasedReturnValue();
      v29[0] = v25;
      v29[1] = 3221225472;
      v29[2] = __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2_23;
      v29[3] = &unk_1E894D5E0;
      v31 = v14;
      v30 = v7;
      v27 = v14;
      dispatch_async(v26, v29);

      objc_msgSend(WeakRetained, "didChangeStateWithError:", 0);
      objc_msgSend(*(id *)(a1 + 32), "finish");
      objc_msgSend(*(id *)(a1 + 48), "invalidate");

      v23 = v31;
    }

  }
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_21(uint64_t a1)
{
  -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 32), 3);
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2(uint64_t a1)
{
  -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 32), 0);
}

uint64_t __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_22(uint64_t a1)
{
  -[HAP2AccessoryServerTransportBase setInternalState:](*(_QWORD **)(a1 + 32), 2);
}

uint64_t __55__HAP2AccessoryServerTransportBase__openWithOperation___block_invoke_2_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32), 0);
}

double __57__HAP2AccessoryServerTransportBase_setMaxRequestTimeout___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 24) = result;
  return result;
}

double __53__HAP2AccessoryServerTransportBase_maxRequestTimeout__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

_QWORD *__41__HAP2AccessoryServerTransportBase_state__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = -[HAP2AccessoryServerTransportBase internalState](*(_QWORD **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
