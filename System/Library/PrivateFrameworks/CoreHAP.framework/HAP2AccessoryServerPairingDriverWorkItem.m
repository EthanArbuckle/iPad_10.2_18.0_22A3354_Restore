@implementation HAP2AccessoryServerPairingDriverWorkItem

- (id)maybePairingDriver
{
  return objc_loadWeakRetained((id *)&self->_pairingDriver);
}

- (HAP2AccessoryServerPairingDriverWorkItemInfo)pairingDriver
{
  return (HAP2AccessoryServerPairingDriverWorkItemInfo *)objc_loadWeakRetained((id *)&self->_pairingDriver);
}

- (void)startWithPairingDriver:(id)a3
{
  id v4;
  void *v5;
  HAP2SerializedOperationQueue *v6;
  HAP2SerializedOperationQueue *operationQueue;
  void *v8;
  NSObject *v9;
  int v10;
  HAP2AccessoryServerPairingDriverWorkItem *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  objc_storeWeak((id *)&self->_pairingDriver, v4);
  objc_msgSend(v4, "operationQueue");
  v6 = (HAP2SerializedOperationQueue *)objc_claimAutoreleasedReturnValue();
  operationQueue = self->_operationQueue;
  self->_operationQueue = v6;

  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pairingActivity, v8);

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v9 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEFAULT, "%@ Starting", (uint8_t *)&v10, 0xCu);
  }
  -[HAP2AccessoryServerPairingDriverWorkItem runForPairingDriver:](self, "runForPairingDriver:", v4);

}

- (void)finishWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  HAP2AccessoryServerPairingDriverWorkItem *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerPairingDriverWorkItem operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v6 = hap2Log_accessory;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_ERROR, "%@ Finished with error: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = self;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%@ Finished successfully", (uint8_t *)&v8, 0xCu);
  }
  -[HAP2AccessoryServerPairingDriverWorkItem pairingDriver](self, "pairingDriver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_pairingDriver, 0);
  objc_msgSend(v7, "workItem:finishedWithError:", self, v4);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  -[HAP2AccessoryServerPairingDriverWorkItem maybePairingDriver](self, "maybePairingDriver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServerPairingDriverWorkItem;
  -[HAP2LoggingObject description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)runForPairingDriver:(id)a3
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)cancelWithError:(id)a3
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
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HMFActivity)pairingActivity
{
  return (HMFActivity *)objc_loadWeakRetained((id *)&self->_pairingActivity);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingActivity);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_pairingDriver);
}

@end
